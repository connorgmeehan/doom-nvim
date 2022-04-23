local system = require("doom.core.system")
local fs = require("doom.utils.fs")
local user_utils_ui = require("user.utils.ui")
local user_utils_path = require("user.utils.path")

local create_module = {}

create_module.settings = {
  use_telescope = true,
  popup = {
    relative = "cursor",
    position = {
      row = 1,
      col = 0,
    },
    size = 20,
    border = {
      style = "rounded",
      text = {
        top = "[Input]",
        top_align = "left",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal",
    },
  },
}

local module_template_string = [[
local XXX = {}

-- TODO:
--
--    -

-- XXX.settings = {}

-- XXX.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- XXX.cmds = {}
-- XXX.autocmds = {}
-- XXX.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(XXX.binds, {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "YYY",
--         name = "+ZZZ",
--         {
--         -- first level
--         },
--       },
--     },
--   })
-- end

return XXX
  ]]

local function i(value)
  print(vim.inspect(value))
end

-- TODO: redo this with plenary.path
local function path_get_tail(p)
  local tail = vim.tbl_map(function(s)
    return s:match("/([_%w]-)$") -- capture only dirname
  end, p)
  return tail
end

local function get_dir_files_or_both_in_path_location(path)
  local scan_dir = require("plenary.scandir").scan_dir
  local scan_dir_opts = { search_pattern = ".", depth = 1, only_dirs = true }
  local t_current_module_paths = scan_dir(path, scan_dir_opts)
  return t_current_module_paths
end

local function append_new_module_to_modules_file(mname)
  -- get file.
  -- nvim insert hardcoded position for now!!!!
  -- use treesitter later.
end

local function open_existing_module(mname)
  print("success!! match with: ", mname)
  print(string.format(":e %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
end

local function create_new_module_dir(mname)
  print("no match for: ", input_str, "creating new module...")
  print("......")
  print("...")
  print(string.format("mkdir -p %s/lua/user/modules/%s", system.doom_root, mname))
  print(string.format("touch %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
  print(string.format(":e %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
  -- local buf = nvim_create_buf()
  -- nvim_win_set_buf(0, buf)
end

local function get_current_user_modules()
  local current_modules_path = string.format(
    "%s%slua%suser%smodules",
    system.doom_root,
    system.sep,
    system.sep,
    system.sep
  )

  local t_current_module_paths = get_dir_files_or_both_in_path_location(current_modules_path)
  -- mv into utils.get_doom_modules_list(table -> core|user)
  local t_current_module_names = path_get_tail(t_current_module_paths)
  return t_current_module_names
end

local function compare_input_to_current_modules(input_str)
  local t_current_module_names = get_current_user_modules()

  local has_match = vim.tbl_contains(t_current_module_names, input_str)
  if has_match then
    open_existing_module(input_str)
  else
    local bufhandle = create_new_module_dir(input_str)
    -- TODO: bufhandle.insert module templae
    -- ...
  end
end

-- install fzf with exact matching into telescope -> https://github.com/nvim-telescope/telescope-fzf-native.nvim
local function spawn_telescope_picker_on_table(target_table, callback)
  print("!!!")
  local function pass_telescope_entry_to_callback(prompt_bufnr)
    local state = require("telescope.actions.state")
    local input_str = state.get_current_line(prompt_bufnr)
    local fuzzy_selection = state.get_selected_entry(prompt_bufnr)
    require("telescope.actions").close(prompt_bufnr)

    print(input_str, fuzzy_selection.value)

    if input_str == fuzzy_selection.value then
      print("open file: ", input_str)
    else
      print("create module: ", input_str)
    end

    callback(fuzzy_selection.value)
  end

  -- local function telescope_refactoring(opts)
  opts = opts or require("telescope.themes").get_cursor()

  -- TODO: pass absolute match instead of fuzzy
  require("telescope.pickers").new(opts, {
    prompt_title = "create user module",
    finder = require("telescope.finders").new_table({
      results = target_table,
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", pass_telescope_entry_to_callback)
      map("n", "<CR>", pass_telescope_entry_to_callback)
      return true
    end,
  }):find()
  -- end
end

local function spawn_nui_input(callback)
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event
  local input = Input(create_module.settings.popup, {
    prompt = "> ",
    default_value = "42",
    on_close = function()
      print("Input closed!")
    end,
    on_submit = function(value)
      callback(value)
    end,
    on_change = function(value)
      print("Value changed: ", value)
    end,
  })
  input:mount()
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

local function prompt_user_for_input()
  -- local get_current_modules =
  if create_module.settings.use_telescope then
    local t_current_module_names = get_current_user_modules()
    spawn_telescope_picker_on_table(t_current_module_names, compare_input_to_current_modules)
  else
    spawn_nui_input(compare_input_to_current_modules)
  end
end

create_module.cmds = {
  {
    "DoomCreateModuleUser",
    function()
      prompt_user_for_input()
    end,
  },
  -- {
  --   "DoomCreateModuleCore",
  --   function()
  --     -- do something that makes it easier to configureate the module creation
  --     prompt_user_for_input({ module_type = "core", kind = "feature" })
  --   end,
  -- },
}

-- leader > doom > modules > a/A -> new user module (feature/language)
-- leader > doom > modules > C -> mv module to core
-- leader > doom > modules > P -> migrate module to new plugin

return create_module
