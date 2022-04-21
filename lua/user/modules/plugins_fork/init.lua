local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command

local pf = {}

-- WATCH/USE -->> https://www.youtube.com/watch?v=86sgKa0jeO4
--
-- `:h lua-treesitter-query`
--
--
-- TODO: migrate to plugin `forkify.nvim`

-- TODO: doom.local_plugins_path = "~/code/repos/github.com/"

-- :: REFACTORING :::::::::::::::::::::::::::::::::::::::::::::::::::

-- TODO: create user.util > doom_picker(str_title,table_tele_results,bool_match_exact, cb)

-- refactoring helper
local function doom_picke_do(prompt_bufnr)
  local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)

  print("doom picker:", content)

  require("telescope.actions").close(prompt_bufnr)
end

local function doom_picker_find(opts, title, picker_data)
  local opts = opts or require("telescope.themes").get_cursor()

  require("telescope.pickers").new(opts, {
    prompt_title = title,
    finder = require("telescope.finders").new_table({
      results = picker_data,
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", doom_picke_do)
      map("n", "<CR>", doom_picke_do)
      return true
    end,
  }):find()
end

-- NOTE:
--
--  see how you can just pass a table to the picker in order to generate a picker.

-- local refactoring = require("refactoring")

-- -- refactoring helper
-- local function refactor(prompt_bufnr)
--   local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
--   require("telescope.actions").close(prompt_bufnr)
--   refactoring.refactor(content.value)
-- end

-- local function telescope_refactoring(opts) end

-- return require("telescope").register_extension({
--     exports = {
--         refactors = telescope_refactoring,
--     },
-- })

-- :::::::::::::::::::::::::::::::::::::::::::::::::::

-- local q = require("vim.treesitter.query")
--
-- local function i(value)
--   print(vim.inspect(value))
-- end
--
-- local bufnr = 4
--
-- local language_tree = vim.treesitter.get_parser(0)
-- local syntax_tree = language_tree:parse()
-- local root = syntax_tree[1]:root()
--
-- local query = vim.treesitter.parse_query(
--   "java",
--   [[
-- (method_declaration
--     (modifiers
--         (marker_annotation
--             name: (identifier) @annotation (#eq? @annotation "Test")))
--     name: (identifier) @method (#offset! @method))
-- ]]
-- )
--
-- for _, captures, metadata in query:iter_matches(root, bufnr) do
--   i(q.get_node_text(captures[2], bufnr))
--   i(metadata)
-- end

-- :::::::::::::::::::::::::::::::::::::::::::::::::::

local q = {}

q.packages = {
  "aaaa/tttt_ss-st.nvim",
  ["t_e-rrr.aaa"] = { "ccc/t_e-rrr.aaa" },
  ["xxxx"] = { "yyy/xxx" },
}

local function fork_plugin_under_cursor()
  -- ADD NUI POPUP

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
