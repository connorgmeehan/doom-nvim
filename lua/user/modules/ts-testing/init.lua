local ts_locals = require("nvim-treesitter.locals")
local ts_utils = require("nvim-treesitter.ts_utils")

local ts_testing = {}

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
      local tnode = ts_helpers.get_node_at_cursor(0)
      -- print("node type -> ", vim.inspect(tnode:type()))

      -- TODO: use nui popup to log node environment clearly.

-- tsnode:parent()						*tsnode:parent()*
-- 	Get the node's immediate parent.
--
-- tsnode:next_sibling()					*tsnode:next_sibling()*
-- 	Get the node's next sibling.
--
-- tsnode:prev_sibling()					*tsnode:prev_sibling()*
-- 	Get the node's previous sibling.
--
-- tsnode:next_named_sibling()				*tsnode:next_named_sibling()*
-- 	Get the node's next named sibling.
--
-- tsnode:prev_named_sibling()				*tsnode:prev_named_sibling()*
-- 	Get the node's previous named sibling.
--
-- tsnode:iter_children()					*tsnode:iter_children()*
-- 	Iterates over all the direct children of {tsnode}, regardless of
-- 	whether they are named or not.
-- 	Returns the child node plus the eventual field name corresponding to
-- 	this child node.
--
-- tsnode:field({name})					*tsnode:field()*
-- 	Returns a table of the nodes corresponding to the {name} field.
--
-- tsnode:child_count()					*tsnode:child_count()*
-- 	Get the node's number of children.
--
-- tsnode:child({index})					*tsnode:child()*
-- 	Get the node's child at the given {index}, where zero represents the
-- 	first child.
--
-- tsnode:named_child_count()				*tsnode:named_child_count()*
-- 	Get the node's number of named children.
--
-- tsnode:named_child({index})				*tsnode:named_child()*
-- 	Get the node's named child at the given {index}, where zero represents
-- 	the first named child.




      local s = string.format(
        [[# TS NODE @ CURSOR

        type: %s
        start: %s
        end: %s

]],
        tnode:type(),
        tnode:start(),
        tnode:end_(),
        tnode:symbol(),
        tnode:range(),
        tnode:sexpr(),
        tnode:id()
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
