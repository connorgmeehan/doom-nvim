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

-- local query_lang = "lua"

local query_str = [[
; Scopes

[
  (chunk)
  (do_statement)
  (while_statement)
  (repeat_statement)
  (if_statement)
  (for_statement)
  (function_declaration)
  (function_definition)
] @scope

; Definitions

(assignment_statement
  (variable_list
    (identifier) @definition.var))

(assignment_statement
  (variable_list
    (dot_index_expression . (_) @definition.associated (identifier) @definition.var)))

; (function_declaration
;   name: (identifier) @definition.function)
;   (#set! definition.function.scope "parent")
;
; (function_declaration
;   name: (dot_index_expression
;     . (_) @definition.associated (identifier) @definition.function))
;   (#set! definition.method.scope "parent")
;
; (function_declaration
;   name: (method_index_expression
;     . (_) @definition.associated (identifier) @definition.method))
;   (#set! definition.method.scope "parent")
;
; (for_generic_clause
;   (variable_list
;     (identifier) @definition.var))
;
; (for_numeric_clause
;   name: (identifier) @definition.var)
;
; (parameters (identifier) @definition.parameter)

; References

[
  (identifier)
] @reference

]]

local references = {}

ts_query_monitor.settings = {
  buf_name = "TS_MONITOR",
  popup = {
    enter = false,
    focusable = false,
    border = {
      style = "rounded",
      text = {
        top = "TS MONITOR",
      },
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

-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

local function i(value)
  print(vim.inspect(value))
end

-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

local function get_query(query_name)
  local language_tree = vim.treesitter.get_parser(0)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local sep = "\n"

  local matches = {}

  -- opts.ft
  -- opts.query
  local the_lang = query_lang or vim.bo.filetype

  local ok, result = pcall(vim.treesitter.parse_query, the_lang, query_name)

  if ok then
    -- for _, captures, metadata in result:iter_matches(root, references.target_bufnr) do
    --   i(q.get_node_text(captures[2], references.target_bufnr))
    --   -- i(metadata)
    --   table.insert(matches, q.get_node_text(captures[2], references.target_bufnr))
    -- end
    return table.concat(matches, sep)
  else
    return result
  end
end

local function popup_set_content()
  local str_display = get_query(query_str)
  vim.api.nvim_buf_set_lines(references.popup.bufnr, 0, 1, false, vim.fn.split(str_display, "\n"))
end

local function refresh_content()
  popup_set_content()
end

local function reset_monitor()
  if references.popup ~= nil then
    references.popup:unmount()
  end
  references.target_bufnr = nil
  references.popup = nil
end

local function detach_and_reset(bufnr)
  cmd(string.format("autocmd! %s%d WinLeave,BufLeave", AUTOCMD_PREFIX, bufnr))
  reset_monitor()
end

local function attach_autocmds(bufnr)
  utils.make_augroup(string.format("%s%d", AUTOCMD_PREFIX, bufnr), {
    {
      "InsertChange,InsertLeave",
      string.format("<buffer=%d>", bufnr),
      refresh_content,
    },
    {
      "WinLeave,BufLeave",
      string.format("<buffer=%d>", bufnr),
      function()
        detach_and_reset(bufnr)
      end,
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

  -- rename monitor buffer
  vim.api.nvim_buf_set_name(popup.bufnr, ts_query_monitor.settings.buf_name)

  popup_set_content()
  attach_autocmds(references.target_bufnr)
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
