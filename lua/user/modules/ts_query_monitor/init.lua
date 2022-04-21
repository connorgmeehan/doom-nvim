local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local q = require("vim.treesitter.query")
local api = vim.api
local cmd = api.nvim_command
local utils = require("doom.utils")

-- TODO:
--
-- migrate into self contained plugin w/`migrate_module_into_plugin`
-- rename `ts-query-builder.nvim`
--
-- chose inline query or dedicated query window.

local ts_query_monitor = {}

ts_query_monitor.settings = {
  popup = {
    enter = false,
    focusable = false,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
    buf_options = {
      modifiable = true,
      readonly = false,
    },
  },
}

local function i(value)
  print(vim.inspect(value))
end

local function popup_set_content(bufnr, str)
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, vim.fn.split(str, "\n"))
end

-- 1. press bind toggle
-- 2. spawn_query_monitor
-- 3. attach autocmds
-- 	insertChange,insertLeave
-- 	get query
-- 	iter_query >> reset monitor buffer
-- 4. close on leave

-- utils.make_augroup = function(group_name, cmds, existing_group)
-- utils.make_autocmd = function(event, pattern, action, group, nested, once)

local monitor_query = vim.treesitter.parse_query(
  "java",
  [[
(method_declaration
    (modifiers
        (marker_annotation
            name: (identifier) @annotation (#eq? @annotation "Test")))
    name: (identifier) @method (#offset! @method))
]]
)

local function get_query_match(the_query)
  local language_tree = vim.treesitter.get_parser(0)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  local matches = {}

  for _, captures, metadata in the_query:iter_matches(root, bufnr) do
    i(q.get_node_text(captures[2], bufnr))
    i(metadata)
    table.insert(matches, q.get_node_text(captures[2], bufnr))
  end

  local sep = "\n"
  return table.concat(matches, sep)
end

-- popu title / buf title / buf rename???
--
-- 1. create update autocmd for buffer
-- 2. create kill_query_monitor autocmd on buf leave
local function spawn_query_monitor(bufnr)
  if bufnr == nil then
    bufnr = vim.api.nvim_win_get_buf(0)
  end
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event
  local popup = Popup(ts_query_monitor.settings.popup)
  popup:mount()
  -- popup:on(event.BufLeave, function()
  --   popup:unmount()
  -- end)
  popup_unmount_if_leave(bufnr, function()
    popup:unmount()
  end)
  popup_set_content(popup.bufnr, get_query_match(monitor_query))
end

local function kill_query_monitor() end

local function attach(bufnr)
  -- utils.make_augroup(string.format("UserTSQueryMonitor_%d", bufnr), {
  --   "InsertChange,InsertLeave",
  --   string.format("<buffer=%d>", bufnr),
  -- })
end

local function detach(bufnr, cb)
  -- cmd(string.format("autocmd! UserTSToggleQueryMonitor_%d BufLeave", bufnr))
end

ts_query_monitor.cmds = {
  {
    "UserTSSpawnQueryMonitorForCurrBuf",
    function()
      spawn_query_monitor()
    end,
  },
}
pf.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(pf.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "v",
        name = "+testing",
        {
          {
            "q",
            [[<cmd>UserTSSpawnQueryMonitorForCurBuf<cr>]],
            name = "toggle query monitor",
            options = { silent = false },
          },
        },
      },
    },
  })
end

return ts_query_monitor
