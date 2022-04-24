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

local function get_module_template_from_name(mname)
  return string.format(
    [[
local %s = {}

-- TODO:
--
--    -

-- %s.settings = {}

-- %s.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- %s.cmds = {}
-- %s.autocmds = {}
-- %s.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(%s.binds, {
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

return %s
  ]],
    mname,
    mname,
    mname,
    mname,
    mname,
    mname,
    mname,
    mname
  )
end

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
  vim.cmd(string.format(":e %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
end

-- local function get_module_template_from_name(mname)
--   local s = ""
--   return s
-- end

local function create_new_module_dir(new_mname)
  print("CREATE MODULE: ", new_mname)
  local path_user_modules = string.format("%s/lua/user/modules", system.doom_root)
  local new_module_path = string.format("%s%s%s", path_user_modules, system.sep, new_mname)
  local new_module_init_file = string.format("%s%sinit.lua", new_module_path, system.sep)

  vim.cmd(string.format("!mkdir -p %s", new_module_path))
  vim.cmd(string.format("!touch %s", new_module_init_file))

  fs.write_file(new_module_init_file, get_module_template_from_name(new_mname), "w+")

  vim.cmd(string.format(":e %s", new_module_init_file))

  -- local newbuf = vim.api.nvim_create_buf(1, 0)
  -- vim.api.nvim_buf_set_lines(newbuf, 0, 1, false, vim.fn.split(module_template_string, "\n"))

  -- set file to cur bef
  -- vim.cmd(string.format(":%sb", newbuf))
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

-- local function check_match_in_target_table(t, s)
--   return vim.tbl_contains(t, s)
-- end

local function compare_selection_to_target_table(target_table, input_str)
  local input_trimmed = vim.trim(input_str)
  local has_match = vim.tbl_contains(target_table, input_trimmed)
  if has_match then
    open_existing_module(input_trimmed)
  else
    create_new_module_dir(input_trimmed)
  end
end

-- install fzf with exact matching into telescope -> https://github.com/nvim-telescope/telescope-fzf-native.nvim
local function spawn_telescope_picker_on_table(target_table, callback)
  -- TODO: rename `use_fuzzy_or_line`
  local function pass_telescope_entry_to_callback(ui_type, prompt_bufnr)
    local state = require("telescope.actions.state")
    local str_curr_line = state.get_current_line(prompt_bufnr)
    local fuzzy_selection = state.get_selected_entry(prompt_bufnr)
    require("telescope.actions").close(prompt_bufnr)

    if ui_type == "fuzzy" then
      -- open
      callback(target_table, fuzzy_selection.value)
    elseif ui_type == "line" then
      -- create
      callback(target_table, str_curr_line)
    end
  end

  local function use_fuzzy(prompt_buf)
    pass_telescope_entry_to_callback("fuzzy", prompt_buf)
  end
  local function use_line(prompt_buf)
    pass_telescope_entry_to_callback("line", prompt_buf)
  end

  opts = opts or require("telescope.themes").get_cursor()

  -- TODO: pass absolute match instead of fuzzy
  require("telescope.pickers").new(opts, {
    prompt_title = "create user module",
    finder = require("telescope.finders").new_table({
      results = target_table,
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", use_fuzzy)
      map("n", "<CR>", use_fuzzy)
      map("i", "<C-e>", use_line)
      map("n", "<C-e>", use_line)
      -- <C-x> rm module
      -- <C-v> open split
      -- <C-r> create new in split
      return true
    end,
  }):find()
end

local function spawn_nui_input(target_table, callback)
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event
  local input = Input(create_module.settings.popup, {
    prompt = "> ",
    default_value = "42",
    on_close = function()
      print("Input closed!")
    end,
    on_submit = function(value)
      callback(target_table, value)
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
  -- edit_create_from_table(
  --   create_module.settings.use_telescope,  -> ui type
  --   t_current_module_names,                -> table
  --   compare_selection_to_target_table    -> decider function
  -- )
  local t_current_module_names = get_current_user_modules()
  if create_module.settings.use_telescope then
    spawn_telescope_picker_on_table(t_current_module_names, compare_selection_to_target_table)
  else
    spawn_nui_input(t_current_module_names, compare_selection_to_target_table)
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

create_module.binds = {}
-- leader > doom > modules > a/A -> new user module (feature/language)
-- leader > doom > modules > C -> mv module to core
-- leader > doom > modules > P -> migrate module to new plugin
if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(create_module.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+doom",
        {
          {
            {
              "M",
              name = "+modules",
              { "e", [[ :DoomCreateModuleUser<cr> ]], name = "edit/create user modules" },
            },
          },
        },
      },
    },
  })
end

return create_module
