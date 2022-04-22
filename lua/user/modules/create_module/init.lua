local system = require("doom.core.system")
local fs = require("doom.utils.fs")

local create_module = {}

local function i(value)
  print(vim.inspect(value))
end

local function append_new_module_to_modules_file()
  -- get file.
  -- nvim insert hardcoded position for now!!!!
  -- use treesitter later.
end

local function create_new_module_from_user_inpet(input_str)
  -- 2. scandir user/modules.

  local current_modules_path = string.format(
    "%s%slua%suser%smodules",
    system.doom_root,
    system.sep,
    system.sep,
    system.sep
  )
  print(" curr mod path -->>", current_modules, input_str)
  -- how did I get the doom nvim path again?????

  -- local current_modules = doom-dir .. lua.. user/modules

  local scan_dir = require("plenary.scandir").scan_dir
  local scan_dir_opts = { search_pattern = ".", depth = 1, only_dirs = true }
  -- local t_current_module_paths = scan_dir(vim.fn.expand(repo_lua_path), scan_dir_opts)
  local t_current_module_paths = scan_dir(current_modules_path, scan_dir_opts)

  -- TODO: strip names only.
  --
  --
  -- i should be able to use plenary.path here to capture only the tail of the path.
  -- local plenary_path = require("plenary.path")
  -- print(plenary_path.))
  --
  -- i(t_current_module_paths)
  local t_current_module_names = vim.tbl_map(function(s)
    return s:match("/([_%w]-)$") -- capture only dirname
  end, t_current_module_paths)
  -- i(t_current_module_names)

  local has_match = false

  for _, mname in ipairs(t_current_module_names) do
    if mname == input_str then
      has_match = true
    end
  end

  if has_match then
    print("success!! match with: ", input_str)

  -- 3. if name match
  --  loop match current modules to user input
  --  open matched-name file in cur win


  else
    print("no match for: ", input_str, "creating new module...")
    print("......")
    print("...")

  -- 4. else create new file name = input AND open in cur win

  --        insert template text into new module file buffer.
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

  --          nvim api insert text into buffr x

  -- 6. put insert in -- todo: comment on top


  end




end

local function prompt_user_for_input()
  -- 1. nui -> input
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event

  local popup_options = {
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
  }

  local input = Input(popup_options, {
    prompt = "> ",
    default_value = "42",
    on_close = function()
      print("Input closed!")
    end,
    on_submit = function(value)
      create_new_module_from_user_inpet(value)
    end,
    on_change = function(value)
      print("Value changed: ", value)
    end,
  })

  -- mount/open the component
  input:mount()
  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

local function create_new_user_module()
  prompt_user_for_input()
end

-- 1. input > ask for module name
-- 2. if name does not exist > scandir compare to input name
-- 3. then create module.
-- 4. tree sitter analyse that the module has all of the necessary parts.
-- 5. -> create (settings,packages,cmds,autocmds,binds)

create_module.cmds = {
  {
    "DoomCreateModuleUser",
    function()
      create_new_user_module()
      -- TODO:
      --
      --

      -- 1. get list / table of existing module names.
      -- 2. get user input
      -- 3. does input exist?
      -- 4. create dir
      -- 5. create init.lua
      -- 6. open file into buffer
      -- 7. insert template for module.
      -- 8. open the module file in a split window
      -- 9. use telescope to filter input to see if it exists.
      -- 10. if select already existing module > open that module file in split
      -- 11. if it does not exist > create new module.
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
