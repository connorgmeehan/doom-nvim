local fs = require("doom.utils.fs")
local user_utils_ui = require("user.utils.ui")
local user_utils_path = require("user.utils.path")
local user_utils_modules = require("user.utils.modules")

local module_rename = {}

-- TODO:
--
--
--    3. update
--    	a. `modules.lua`
--    	  	+  get user modules
--    	  	+ get prev name match
--    	  	+ replace with new name
--
-- 		b. check name aleady exists? > open nui window again?
--
--    	c. update module dirname

local function update_module_name(old_name)
  -- 1. transform `modules.lua` with architext
  -- 2. change module dir name.
end

local function promt_for_new_name() end

local function picker_rename(config)
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

local function rename_modules_select()
  --    1. select module
  --    get all modules > TODO: copy from create_module.

  -- TODO: get_module_data() -- return { path, name, section }
  local t_current_module_names = user_utils_path.get_user_mod_names()
  print("rename")

  local modules_data = user_utils_path.get_module_meta_data()
  print(vim.inspect(modules_data))

  --    map entries for UI

  -- local picker_config = {
  --   bufnr = bufnr, -- we use the module dir path here instead.
  --   entries = {},
  --   entries_mapped = {},
  --   callback = fork_package,
  -- }
  -- for k, v in pairs(package_string_nodes) do
  --   local nt = tsq.get_node_text(v, bufnr)
  --   table.insert(picker_config.entries, nt)
  --   picker_config.entries_mapped[nt] = v
  -- end

 --    call picker with `promt_for_new_name` callback
  -- fork_plugins_picker_cur_buf(picker_config)
end

-- module_rename.settings = {}

-- module_rename.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

module_rename.cmds = {
  {
    "DoomModulesRenameSelect",
    function()
      rename_modules_select()
    end,
  },
}

-- module_rename.autocmds = {}
module_rename.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(module_rename.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+Doom",
        {
          {
            {
              "M",
              name = "+modules",
              { "r", [[ :DoomModulesRenameSelect<cr> ]], name = "rename" },
            },
          },
        },
      },
    },
  })
end

return module_rename
