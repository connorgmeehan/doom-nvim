local tsq = require("vim.treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command

local pf = {}

-- WATCH/USE -->> https://www.youtube.com/watch?v=86sgKa0jeO4
--
-- `:h lua-treesitter-query`
-- `forkify.nvim`

-- TODO: doom.local_plugins_path = "~/code/repos/github.com/"
--
local lua_query_scopes = [[
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
]]

local lua_query_assignment_identifier = [[
assignment_statement
 (variable_list
   (identifier) @definition.var))
]]

local lua_query_assignment_dot = [[
(assignment_statement
  (variable_list
    (dot_index_expression . (_) @definition.associated (identifier) @definition.var)))
]]

local lua_query_function_identifier = [[
(function_declaration
  name: (identifier) @definition.function)
  (#set! definition.function.scope "parent")
]]

local lua_query_function_dot = [[
(function_declaration
  name: (dot_index_expression
    . (_) @definition.associated (identifier) @definition.function))
  (#set! definition.method.scope "parent")
]]

local lua_query_function_method_index = [[
(function_declaration
  name: (method_index_expression
    . (_) @definition.associated (identifier) @definition.method))
  (#set! definition.method.scope "parent")
]]

local lua_query_for_clause = [[
 (for_generic_clause
   (variable_list
     (identifier) @definition.var))
]]
local lua_query_for_numeric = [[
 (for_numeric_clause
   name: (identifier) @definition.var)

]]

local lua_query_parameters = [[
 (parameters (identifier) @definition.parameter)
]]

local lua_query_reference = [[
 [
   (identifier)
 ] @reference
]]

-- local lua_query_package_name_strings = [[
-- (assignment_statement
--   (variable_list
--     (dot_index_expression . (_) @definition.associated (identifier) @definition.var)))
-- ]]

-- assignment_statement [88, 0] - [92, 1]
--   variable_list [88, 0] - [88, 10]
--     name: dot_index_expression [88, 0] - [88, 10]
--       table: identifier [88, 0] - [88, 1]
--       field: identifier [88, 2] - [88, 10]
--   expression_list [88, 13] - [92, 1]
--     value: table_constructor [88, 13] - [92, 1]
--       field [89, 2] - [89, 24]
--         value: string [89, 2] - [89, 24]
--       field [90, 2] - [90, 41]
--         name: string [90, 3] - [90, 16]
--         value: table_constructor [90, 20] - [90, 41]
--           field [90, 22] - [90, 39]
--             value: string [90, 22] - [90, 39]
--       field [91, 2] - [91, 26]
--         name: string [91, 3] - [91, 9]
--         value: table_constructor [91, 13] - [91, 26]
--           field [91, 15] - [91, 24]
--             value: string [91, 15] - [91, 24]
local test_table = {}
test_table.packages = {
  "aaaa/tttt_ss-st.nvim",
  ["t_e-rrr.aaa"] = { "ccc/t_e-rrr.aaa" },
  ["xxxx"] = { "yyy/xxx" },
}

-- get string fields in the first table level
-- or field[1] in second table levels
local lua_query_package_name_strings = [[
(assignment_statement
  (variable_list
    (dot_index_expression . (_) @definition.associated (identifier) @definition.var)))
]]

local function print_query()
  local bufnr = api.nvim_get_current_buf()
  local language_tree = vim.treesitter.get_parser(bufnr)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local query = vim.treesitter.parse_query("lua", lua_query_package_name_strings)

  for id, captures, metadata in query:iter_matches(root, bufnr, root:start(), root:end_()) do
    for id, node in pairs(captures) do
      local name = query.captures[id]
      local nt = tsq.get_node_text(node, bufnr)
      local node_data = metadata[id] -- Node level metadata
      local ns = node:start()
      if name == "definition.var" and nt == "packages" then
        -- this captures the `packages` identifier if it is a dot assignment expr.
        -- it does not account for module name atm.
        print("capture id: ", name, " | node text:", nt)
        local parent = node:parent()
        local pp = parent:parent()
        local ppp = pp:parent()
        local sib = parent:prev_sibling()
        print("parent:", tsq.get_node_text(parent,bufnr))
        -- print("nxt sib:", tsq.get_node_text(sib,bufnr))
        print(sib)
        print("parent type", parent:type())
        print("pp type", pp:type())
        print("ppp type", ppp:type())

        local pp_sib = pp:next_sibling()
        local pp_sib2 = pp_sib:next_sibling()
        print("pp.sib:", pp_sib:type())
        print("pp.sib2:", pp_sib2:type()) -- expression list

        print(ppp:child_count())

        for child, name in pp_sib2:iter_children() do
          print(tsq.get_node_text(child,bufnr))
            print("PPP child name", name)
          for c, n in child:iter_children() do
            local t = tsq.get_node_text(c,bufnr)
            print(":::", n, " // ", t)
          end
        end

        -- TODO:
        -- use node funcs her to filter string field nodes
      end
    end

    -- if match[2] ~= nil then
    --   print(tsq.get_node_text(match[2], bufnr))
    -- end
  end
end

-- :::::::::::::::::::::::::::::::::::::::::::::::::::

local function fork_plugin_under_cursor()
  -- ADD NUI POPUP
  print_query()

  -- 1. query for package strings
  -- 2. pass table set to doom_picker.
  -- 3. create callback that replaces the string.
end

local function fork_all_packages(include_deps)
  -- if include_deps
end

pf.cmds = {
  { "DoomForkPackageUnderCursor", fork_plugin_under_cursor },
  { "DoomForkPackagePicker", fork_plugin_under_cursor },
  {
    "DoomForkAllPackages",
    function()
      fork_all_packages()
    end,
  },
  {
    "DoomForkAllPackagesInclDeps",
    function()
      fork_all_packages(true)
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
            "u",
            [[<cmd>DoomForkPackageUnderCursor<cr>]],
            name = "fork plugin at cursor",
            options = { silent = false },
          },
          {
            "w",
            [[<cmd>DoomForkPackagePicker<cr>]],
            name = "fork plugin by picker",
            options = { silent = false },
          },
        },
      },
    },
  })
end

return pf
