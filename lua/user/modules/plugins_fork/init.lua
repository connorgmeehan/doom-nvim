local tsq = require("vim.treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command
local doom_queries = require("user.utils.doom_queries")

-- rename this module to `module_package_get_local`

local pf = {}

-- `:h lua-treesitter-query`
-- `forkify.nvim`
-- doom.local_plugins_path = "~/code/repos/github.com/"
--
local local_prefix = ""

local test_table = {}
test_table.packages = {
  "first/tttt_ss-st.nvim",
  ["first.aaa"] = { "second/t_e-rrr.aaa" },
  ["first"] = { "second/xxx", opt = true },
  ["firstX"] = { "second/rst.nnnnn", opt = true, arst = "arst" },
}

--     for id, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
--       local name = query.captures[id] -- name of the capture in the query
--       -- typically useful info about the node:
--       local type = node:type() -- type of the captured node
--       local row1, col1, row2, col2 = node:range() -- range of the capture
--       ... use the info here ...
--     end
-- <

-- return table of nodes in capture name
local function log_captures(root, bufnr, q, capture_name)
  local capture_name_matches = {}
  if q ~= nil then
    for id, node, metadata in q:iter_captures(root, bufnr, root:start(), root:end_()) do
      local name = q.captures[id] -- name of the capture in the query

      -- refactor into function get_capture from query
      if name == capture_name then
        table.insert(capture_name_matches, node)
      end
    end
  end
  return capture_name_matches
end

-- todo: if bufnr or current buf
local function get_query(query_str, bufnr)
  local bufnr = api.nvim_get_current_buf()
  local language_tree = vim.treesitter.get_parser(bufnr)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  local q = vim.treesitter.parse_query("lua", query_str)
  return bufnr, root, q
end

local function filter_query_for_packages_field_string_nodes(bufnr, root, query_parsed)
  local package_string_nodes = {}
  for _, captures in query_parsed:iter_matches(root, bufnr, root:start(), root:end_()) do
    for id, node in pairs(captures) do
      local name = query_parsed.captures[id]
      local nt = tsq.get_node_text(node, bufnr)
      if name == "definition.var" and nt == "packages" then
        local parent = node:parent()
        local pp = parent:parent()
        local pp_sib = pp:next_sibling()
        local pp_sib2 = pp_sib:next_sibling()
        for child, _ in pp_sib2:iter_children() do
          for c, _ in child:iter_children() do
            local t = tsq.get_node_text(c, bufnr)
            local ccnt = c:child_count()
            if ccnt == 1 then
              table.insert(package_string_nodes, c)
            elseif ccnt == 5 then
              local node_t_value = c:child(4)
              local child_str_node = node_t_value:child(1)
              table.insert(package_string_nodes, child_str_node)
            end
          end
        end
      end
    end
  end
  return package_string_nodes
end

local function app_end_text_to_top_locals()
  -- query the end of the `requires` block on top of the file
end

local function ts_nodes_prepend_text(nodes, bufnr)
  for i, v in ipairs(nodes) do
    local type = v:type() -- type of the captured node
    local nt = tsq.get_node_text(v, bufnr)
    local sr, sc, er, ec = v:range()
    -- print( string.format("type: %s, text: %s, [%s %s, %s %s]", type, nt, sr + 1, sc, er + 1, ec))
  end
end

local function ts_node_append_text(node) end

local function ts_node_surround_text(node) end

local function prepare_forking_plugin(bufnr, repo_str)
  -- 1. append string to table field
  --    buf insert text
  -- 2. require the doom.paths on top.
  --    get top locals require block scope range end
  --    insert require user.utils.paths.", repo_str
  --- 3. pass string to doom.opts.fork_cmd = "ghm fork %s"
  --      vim.cmd(string.format(":! <cr>", repo_str)
end

local function print_query()
  local bufnr, root, q_parsed = get_query(doom_queries.lua_assignment_dot)

  local psns = filter_query_for_packages_field_string_nodes(bufnr, root, q_parsed)

  for _, node in pairs(psns) do
    local node_text = tsq.get_node_text(node, bufnr)
    -- print("node_text: ", node:type(), node_text)
    local sr, sc, er, ec = node:range()

    -- TODO:
    --
    -- 1. create picker that searches the package text fields
    -- 2. copy picker from `create_module`
    -- 3. callback -> prepare_forking_plugin(repo_str)
  end

  local bufnr, root, q_parsed_2 = get_query(doom_queries.doom_get_package_repo_fields)

  local package_string_nodes = log_captures(root, bufnr, q_parsed_2, "package_string")

  ts_nodes_prepend_text(package_string_nodes, bufnr)
end

local function fork_plugin_under_cursor()
  print_query()
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
