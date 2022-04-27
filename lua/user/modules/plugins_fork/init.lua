local tsq = require("vim.treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command
local doom_queries = require("user.utils.doom_queries")
local user_ts_utils = require("user.utils.ts")

-- rename this module to `module_package_get_local`
--
-- XXX prepen text works
--
-- - refactor telescope table picker
-- - pass nodes into picker
-- - select node
-- - transform_prepend_text(node, text, offset)
-- - call `ghm clone ` with node text
-- - insert `require path somehow` on top of file.
--
--
-- 1. make a UI chain
-- 	mv telescope UI function to util.
-- 	a. select plugin
-- 	b. clone/fork?
-- 	c. use local version?
--
-- 	this could be a telescope chain.
--
-- 2. list/filter upstream/local packages. (toggle/modify)
-- doom.local_plugins_path = "~/code/repos/github.com/"
--
--
-- redo the whole thing with `ARCHITEXT` plugin and see if it has streamlined my processes??

local pf = {}

pf.settings = {
  local_prefix = "user_paths.ghq.gh .. ",
}

local test_table = {}
test_table.packages = {
  "first/tttt_ss-st.nvim",
  ["first.aaa"] = { "second/t_e-rrr.aaa" },
  ["first"] = { "second/xxx", opt = true },
  ["firstX"] = { "second/rst.nnnnn", opt = true, arst = "arst" },
}

local function append_text_to_top_locals()
  -- query the end of the `requires` block on top of the file
end

local function fork_package(repo_string_node, bufnr)
  print("fork_package: ", tsq.get_node_text(repo_string_node, bufnr))
  user_ts_utils.ts_single_node_prepend_text(repo_string_node, bufnr, pf.settings.local_prefix)
  -- 1. append string to table field
  --    buf insert text
  -- 2. require the doom.paths on top.
  --    get top locals require block scope range end
  --    insert require user.utils.paths.", repo_str
  --- 3. pass string to doom.opts.fork_cmd = "ghm fork %s"
  --      vim.cmd(string.format(":! <cr>", repo_str)
end

local function fork_plugins_picker(config)
  local function pass_entry_to_callback(prompt_buf)
    local state = require("telescope.actions.state")
    local fuzzy_selection = state.get_selected_entry(prompt_bufnr)
    require("telescope.actions").close(prompt_buf)
    config.callback(config.entries_mapped[fuzzy_selection.value], config.bufnr)
  end

  opts = opts or require("telescope.themes").get_cursor()

  require("telescope.pickers").new(opts, {
    prompt_title = "create user module",
    finder = require("telescope.finders").new_table({
      results = config.entries,
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", pass_entry_to_callback)
      map("n", "<CR>", pass_entry_to_callback)
      return true
    end,
  }):find()
end

-- TODO: move params into settings config table so that we only pass an options table to the func.
local function print_query()
  local bufnr, root, q_parsed_2 = user_ts_utils.get_query(doom_queries.doom_get_package_repo_fields)
  local package_string_nodes = user_ts_utils.get_captures(root, bufnr, q_parsed_2, "package_string")

  local picker_config = {
    bufnr = bufnr,
    entries = {},
    entries_mapped = {},
    callback = fork_package,
  }

  for k, v in pairs(package_string_nodes) do
    local nt = tsq.get_node_text(v, bufnr)
    table.insert(picker_config.entries, nt)
    picker_config.entries_mapped[nt] = v
  end

  fork_plugins_picker(picker_config)
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
