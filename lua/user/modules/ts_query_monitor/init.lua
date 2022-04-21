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

local AUTOCMD_PREFIX = "UserTSQueryMonitor_"

local references = {}

ts_query_monitor.settings = {
  popup = {
    enter = false,
    focusable = false,
    border = {
      style = "rounded",
    },
    position = {
      row = "5%",
      col = "95%",
    },
    size = {
      width = "40%",
      height = "90%",
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

-- TODO: create lua query

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

-- utils.make_augroup = function(group_name, cmds, existing_group)
-- utils.make_autocmd = function(event, pattern, action, group, nested, once)

local function get_query_match(bufnr, the_query)
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

local function popup_set_content(popup, str)
  -- local query_match_str = get_query_match(references.target_bufnr, monitor_query)
  local query_match_str = "ABCDEFGH"
  vim.api.nvim_buf_set_lines(
    references.popup.bufnr,
    0,
    1,
    false,
    vim.fn.split(query_match_str, "\n")
  )
end

local function target_on_insert()
  popup_set_content(references.popup, get_query_match(target_bufnr, monitor_query))
end

local function detach_autocmds()
  cmd(string.format("autocmd! %s%d BufLeave", AUTOCMD_PREFIX, references.target_bufnr))
end

local function reset_monitor()
  detach_autocmds()
  references.popup:unmount()
  references.target_bufnr = nil
  references.popup = nil
end

local function on_buf_leave()
  reset_monitor()
end

local function attach_autocmds()
  utils.make_augroup(string.format("%s%d", AUTOCMD_PREFIX, references.target_bufnr), {
    -- update monitor content
    {
      "InsertChange,InsertLeave",
      string.format("<buffer=%d>", references.target_bufnr),
      target_on_insert,
    },
    -- kill monitor on target leave
    {
      "BufLeave",
      string.format("<buffer=%d>", references.target_bufnr),
      on_buf_leave,
    },
  })
end

local function spawn_monitor()
    references.target_bufnr = vim.api.nvim_win_get_buf(0)

    local Popup = require("nui.popup")
    local event = require("nui.utils.autocmd").event
    local popup = Popup(ts_query_monitor.settings.popup)
    popup:mount()
    references.popup = popup

    popup_set_content()
    attach_autocmds(target_bufnr)
end

local function toggle_query_monitor()
  if references.target_bufnr == nil then
    spawn_monitor()
  else
    reset_monitor()
  end
end

ts_query_monitor.cmds = {
  {
    "UserTSSpawnQueryMonitorForCurBuf",
    function()
      toggle_query_monitor()
    end,
  },
}

ts_query_monitor.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(ts_query_monitor.binds, {
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
