local ts_locals = require("nvim-treesitter.locals")
local ts_utils = require("nvim-treesitter.ts_utils")

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/doc/nvim-treesitter.txt

-- 1. nui popup.
-- 2. display all kinds of siblings/children/parents/block etc.

local ts_testing = {}

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- UI

local popup_settings = {
  enter = true,
  focusable = true,
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
}

local function make_popup(display_string)
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup(popup_settings)

  -- mount/open the component
  popup:mount()

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  -- set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, vim.fn.split(display_string, "\n"))
end

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- Lua module: vim.treesitter.language                      *treesitter-language*
--
-- inspect_language({lang})                                  *inspect_language()*
--                 Inspects the provided language.
--
--                 Inspecting provides some useful information on the language
--                 like node names, ...
--
--                 Parameters: ~
--                     {lang}  The language.
--
-- require_language({lang}, {path}, {silent})                *require_language()*
--                 Asserts that the provided language is installed, and
--                 optionally provide a path for the parser
--
--                 Parsers are searched in the `parser` runtime directory.
--
--                 Parameters: ~
--                     {lang}    The language the parser should parse
--                     {path}    Optional path the parser is located at
--                     {silent}  Don't throw an error if language not found

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- parse window
-- parse buffer
-- parse filepath

-- visual select parent
-- visual select next sibling / child
-- move cursor to parent / sibling / child

-- add curent command to binds.

-- move binds around in the binds tree.

-- get string between start / end > print in the popup.

-- print some type of type?

-- how can I use a query?

-- vim.treesitter.query.get_query({lang}, {query_name})                                  *get_query()*
--                 Returns the runtime query {query_name} for {lang}.
--
--                 Parameters: ~
--                     {lang}        The language to use for the query
--                     {query_name}  The name of the query (i.e. "highlights")
--
--                 Return: ~
--                     The corresponding query, parsed.

ts_testing.settings = {}

local ts_helpers = {}

ts_helpers.get_node_at_cursor = function(win)
  return ts_utils.get_node_at_cursor(win)
end

ts_helpers.find_definition = function(node, bufnr)
  return ts_locals.find_definition(node, bufnr)
end

ts_helpers.find_references = function(node, scope, bufnr, definition)
  if not definition then
    definition = ts_helpers.find_definition(node, bufnr)
  end

  local references = {}
  for _, ref in ipairs(ts_locals.find_usages(node, scope, bufnr)) do
    if ref ~= definition then
      table.insert(references, ref)
    end
  end

  return references
end

ts_helpers.get_node_text = function(node, bufnr, sep)
  sep = sep or " "

  return table.concat(ts_utils.get_node_text(node, bufnr), sep)
end

-- TODO:
--
-- >>> COPY PASTE EXAMPLES FROM NVIM-TREESITTER. <<<<
--
-- in the same way as I copied nui examples.
-- so that I can get started fast. then it should be much more easy to do this.
--
--
-- >> https://github.com/nvim-treesitter/nvim-treesitter#available-modules
-- >> :h nvim-treesitter

local function get_node_info_string(node, title)
  if node == nil then
    return "none"
  end
  local tsn_id = node:id()
  local tsn_type = node:type()
  local tsn_symbol = node:symbol()
  local tsn_range = node:range()
  local tsn_sexpr = node:sexpr()
  local tsn_child_count = node:child_count()
  local tsn_start_row, tsn_start_col, tsn_start_bytecount = node:start()
  local tsn_end_row, tsn_end_col, tsn_end_bytecount = node:end_()

  local str_start = string.format([[%s, %s,  %s]], tsn_start_row, tsn_start_col, tsn_start_row)
  local str_end = string.format([[%s, %s, %s]], tsn_end_row, tsn_end_col, tsn_end_row)

  local node_text = ts_helpers.get_node_text(node)

  local ret_str = string.format(
    [[
>> %s:
%s | %s | %s | %s
%s
------------------
		]],
    title,
    tsn_symbol,
    tsn_type,
    str_start,
    str_end,
    node_text
  )
  return ret_str
end

local function get_node_text_preview(node) end

-- Can refactor take the functions below and hoist them to local functions at
-- the beginning of the file?
ts_testing.cmds = {
  {
    "TSTestingPrintCursorEnvironment",
    function()
      local cursor_node = ts_helpers.get_node_at_cursor(0) -- current window
      local INFO_NODE_CURSOR = get_node_info_string(cursor_node, "cursor node")

      local parent_node = cursor_node:parent()
      local INFO_NODE_PARENT = get_node_info_string(parent_node, "parent")

      local siblin_next = cursor_node:next_sibling()
      local siblin_prev = cursor_node:prev_sibling()
      local INFO_NODE_SIB_PREV = get_node_info_string(siblin_prev, "siblin_prev")
      local INFO_NODE_SIB_NEXT = get_node_info_string(siblin_next, "siblin_next")
      -- local tsn_sib_next_named = cursor_node:next_named_sibling() -- Get the node's next named sibling.
      -- local tsn_sib_prev_named = cursor_node:prev_named_sibling() -- Get the node's previous named sibling.

      -- get prev/next sibling preview texts

      local child_first = cursor_node:child(1)
      local child_last = cursor_node:child(cursor_node:child_count())
      local INFO_NODE_CHILD_FIRST = get_node_info_string(child_first, "child_first")
      local INFO_NODE_CHILD_LAST = get_node_info_string(child_last, "child_last")
      -- cursor_node:iter_children() --   Iterates over all the direct children of {cursor_node}, regardless of whether they are named or not. Returns the child node plus the eventual field name corresponding to this child node.
      -- cursor_node:field({name})					    --   Returns a table of the nodes corresponding to the {name} field.
      -- tsnode:child({index})					    -- Get the node's child at the given {index}, where zero represents the first child.
      -- tsnode:named_child_count() --   Get the node's number of named children.
      -- tsnode:named_child({index})				-- Get the node's named child at the given {index}, where zero represents the first named child.

      -- get first / last child preview text

      local s = string.format(
        [[
%s
%s
%s
%s
%s
%s
]],
        INFO_NODE_CURSOR,
        INFO_NODE_PARENT,
        INFO_NODE_SIB_PREV,
        INFO_NODE_SIB_NEXT,
        INFO_NODE_CHILD_FIRST,
        INFO_NODE_CHILD_LAST
      )
      make_popup(s)
    end,
  },
  {
    "TSTestLog",
    function()
      -- use nui to create a popup that prints treesitter info about a buffer.
      -- number of children.
      -- names etc.
    end,
  },
  {
    "TSTestPrintContext",
    function()
      print("ts-testing -> ")
      local parser = vim.treesitter.get_parser(0)
      local tstree = parser:parse()
      tstree:root()
      print(vim.inspect(tstree))
    end,
  },
  {
    "TSTestingVisualSelectScope",
    function()
      -- ??
      -- nui menu > select what to highlight.
    end,
  },
}

if require("doom.utils").is_module_enabled("whichkey") then
  ts_testing.binds = {
    {
      "<leader>v",
      name = "+testing",
      {
        { "i", "<cmd>TSTestingPrintCursorEnvironment<CR>", name = "ts test print" },
      },
    },
  }
end

return ts_testing
