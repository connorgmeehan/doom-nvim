local system = require("doom.core.system")
local fs = require("doom.utils.fs")

local create_module = {}

create_module.settings = {
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
  -- >>>>>>> shell mkdir mparent .. mname
  print(string.format("mkdir -p %s/lua/user/modules/%s", system.doom_root, mname))
  -- >>>>>>>> shell touch mparent .. mname .. init.lua
  print(string.format("touch %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
  -- :e path to init.lua file
  print(string.format(":e %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
  -- local buf = nvim_create_buf()
  -- nvim_win_set_buf(0, buf)
end

local function compare_input_to_current_modules(input_str)
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
  local has_match = vim.tbl_contains(t_current_module_names, input_str)
  if has_match then
    open_existing_module(input_str)
  else
    local bufhandle = create_new_module_dir(input_str)
    -- TODO: bufhandle.insert module templae
    -- ...
  end
end

local function prompt_user_for_input()
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event
  local input = Input(create_module.settings.popup, {
    prompt = "> ",
    default_value = "42",
    on_close = function()
      print("Input closed!")
    end,
    on_submit = function(value)
      compare_input_to_current_modules(value)
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

create_module.cmds = {
  {
    "DoomCreateModuleUser",
    function()
      prompt_user_for_input()
    end,
  },
  {
    "CreateModuleMoveChunkToModule",
    function()
      -- move selected chunk to another module
      -- helper to make it more easy to organize modules and plugins.
      -- use tree-sitter to analyse which components of a file that should be moved.
      -- use REFACTOR.NVIM?
    end,
  },
}

return create_module
