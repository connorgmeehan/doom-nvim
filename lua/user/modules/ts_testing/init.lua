local ts_locals = require("nvim-treesitter.locals")
local ts_utils = require("nvim-treesitter.ts_utils")

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/doc/nvim-treesitter.txt

local ts_testing = {}

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
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
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




local parsers = require("nvim-treesitter.parsers")

--- local myEnum = Enum {
---     'Foo',          -- Takes value 1
---     'Bar',          -- Takes value 2
---     {'Qux', 10},    -- Takes value 10
---     'Baz',          -- Takes value 11
--- }

---@class RefactorQuery
local Query = {}
Query.__index = Query

Query.query_type = {
  FunctionArgument = "definition.function_argument",
  LocalVarName = "definition.local_name",
  Reference = "reference",
}

function Query.get_root(bufnr, filetype)
  local parser = parsers.get_parser(bufnr or 0, filetype)
  if not parser then
    error("No treesitter parser found. Install one using :TSInstall <language>")
  end
  return parser:parse()[1]:root()
end

function Query.from_query_name(bufnr, filetype, query_name)
  local query = vim.treesitter.get_query(filetype, query_name)
  return Query:new(bufnr, filetype, query)
end

function Query:new(bufnr, filetype, query)
  return setmetatable({
    query = query,
    bufnr = bufnr,
    filetype = filetype,
    root = Query.get_root(bufnr, filetype),
  }, self)
end

function Query:pluck_by_capture(scope, captures)
  if type(captures) ~= "table" then
    captures = { captures }
  end

  local out = {}
  for id, node, _ in self.query:iter_captures(scope, self.bufnr, 0, -1) do
    local n_capture = self.query.captures[id]
    for _, capture in pairs(captures) do
      if n_capture == capture then
        table.insert(out, node)
        break
      end
    end
  end
  return out
end

function Query.find_occurrences(scope, sexpr, bufnr)
  local filetype = vim.bo[bufnr].filetype

  if not sexpr:find("@") then
    sexpr = sexpr .. " @tmp_capture"
  end

  local ok, sexpr_query = pcall(vim.treesitter.parse_query, filetype, sexpr)
  if not ok then
    error(string.format("Invalid query: '%s'\n error: %s", sexpr, sexpr_query))
  end

  local occurrences = {}
  for _, n in sexpr_query:iter_captures(scope, bufnr, 0, -1) do
    table.insert(occurrences, n)
  end

  return occurrences
end

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
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

-- Can refactor take the functions below and hoist them to local functions at
-- the beginning of the file?
ts_testing.cmds = {
  {
    "TSTestingPrintCursorEnvironment",
    function()
      local tsnode = ts_helpers.get_node_at_cursor(0) -- current window
      local tsn_id = tsnode:id()
      local tsn_type = tsnode:type()
      local tsn_symbol = tsnode:symbol()
      local tsn_range = tsnode:range()
      local tsn_sexpr = tsnode:sexpr()
      local tsn_child_count = tsnode:child_count()
      local tsn_start_row, tsn_start_col, tsn_start_bytecount = tsnode:start()
      local tsn_end_row, tsn_end_col, tsn_end_bytecount = tsnode:end_()

      -- get preview text

      local tsn_parent = tsnode:parent() -- Get the node's immediate parent.
      local tsn_parent_type = tsn_parent:type()
      -- local tsn_start_row, tsn_start_col, tsn_start_bytecount = tsnode:start()
      -- local tsn_end_row, tsn_end_col, tsn_end_bytecount = tsnode:end_()

      -- get parent preview text

      local tsn_sib_next = tsnode:next_sibling() -- Get the node's next sibling.
      local tsn_sib_prev = tsnode:prev_sibling() -- Get the node's previous sibling.
      local tsn_sib_next_named = tsnode:next_named_sibling() -- Get the node's next named sibling.
      local tsn_sib_prev_named = tsnode:prev_named_sibling() -- Get the node's previous named sibling.

      -- get prev/next sibling preview texts

      -- tsnode:iter_children() --   Iterates over all the direct children of {tsnode}, regardless of whether they are named or not. Returns the child node plus the eventual field name corresponding to this child node.
      -- tsnode:field({name})					    --   Returns a table of the nodes corresponding to the {name} field.
      -- tsnode:child({index})					    -- Get the node's child at the given {index}, where zero represents the first child.
      -- tsnode:named_child_count() --   Get the node's number of named children.
      -- tsnode:named_child({index})				-- Get the node's named child at the given {index}, where zero represents the first named child.

      -- get first / last child preview text

      local s = string.format(
        [[

        :: CURSOR NODE ::

        ID      ->  %s
        TYPE    ->  %s
        SYMBOL  ->  %s
        SEXPR   ->  %s
        START   ->  row: %s, col: %s, bytecount: %s
        END     ->  row: %s, col: %s, bytecount: %s

        :: PARENT ::

        type    -> %s

        :: SIBLINGS ::

]],
        tsn_id,
        tsn_type,
        tsn_symbol,
        tsn_sexpr,

        tsn_start_row,
        tsn_start_col,
        tsn_start_bytecount,
        tsn_end_row,
        tsn_end_col,
        tsn_end_bytecount,

        tsn_parent_type
        -- tsnode:range(),
        -- tsnode:sexpr(),
        -- tsnode:id(),
        -- tsnode:parent(), -- Get the node's immediate parent.
        -- tsnode:next_sibling(), -- Get the node's next sibling.
        -- tsnode:prev_sibling(), -- Get the node's previous sibling.
        -- tsnode:next_named_sibling(), -- Get the node's next named sibling.
        -- tsnode:prev_named_sibling(), -- Get the node's previous named sibling.
        -- tsnode:iter_children(), --   Iterates over all the direct children of {tsnode}, regardless of whether they are named or not. Returns the child node plus the eventual field name corresponding to this child node.
        -- -- tsnode:field({name}),					    --   Returns a table of the nodes corresponding to the {name} field.
        -- tsnode:child_count(), --   Get the node's number of children.
        -- -- tsnode:child({index}),					    -- Get the node's child at the given {index}, where zero represents the first child.
        -- tsnode:named_child_count() --   Get the node's number of named children.
        -- -- tsnode:named_child({index}),				-- Get the node's named child at the given {index}, where zero represents the first named child.
      )
      print(s)
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
