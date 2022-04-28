local utils = require("doom.utils")
-- `core` is required, doom wouldn't make sense without it.

local config = {}
local filename = "config.lua"

config.source = nil

-- Path cases:
--   1. stdpath('config')/../doom-nvim/config.lua
--   2. stdpath('config')/config.lua
--   3. <runtimepath>/doom-nvim/config.lua
config.source = utils.find_config(filename)

require("doom.core.config.globals")

local function first_load_only()
  if vim.tbl_isempty(doom or {}) then
    require("doom.core.config.vim_options")()

    if doom.check_updates then
      require("doom.core.functions").check_updates()
    end
  end
end

config.load = function()
  config.override_doom_with_user_settings()
  first_load_only()
  config.compile_doom_modules()
  config.apply_user_config()
end

config.override_doom_with_user_settings = function()
  local user_settings = require("doom.core.config.user_settings").settings
  doom = vim.tbl_deep_extend("force", doom, user_settings)
end

config.compile_doom_modules = function()
  -- Combine core modules with user-enabled modules
  local enabled_modules = require("doom.core.config.modules").modules
  local all_modules = vim.tbl_deep_extend("keep", {
    core = {
      "doom",
      "nest",
      "treesitter",
      "reloader",
    },
  }, enabled_modules)

  for section_name, section_modules in pairs(all_modules) do
    for _, module_name in pairs(section_modules) do
      -- Special case for user folder, resolves to `lua/user/modules`
      local root_folder = section_name == "user" and "user.modules"
        or ("doom.modules.%s"):format(section_name)

      local ok, result = xpcall(
        require,
        debug.traceback,
        ("%s.%s"):format(root_folder, module_name)
      )
      if ok then
        doom.modules[module_name] = result
        -- if module_name == "plugins_fork" then
        --   print("y")
        -- end
      else
        local log = require("doom.utils.logging")
        log.error(
          string.format(
            "There was an error loading module '%s.%s'. Traceback:\n%s",
            section_name,
            module_name,
            result
          )
        )
      end
    end
  end
end

config.apply_user_config = function()
  -- Execute user config, log errors if any occur
  local ok, err = xpcall(dofile, debug.traceback, config.source)
  local log = require("doom.utils.logging")
  if not ok and err then
    log.error("Error while running `config.lua. Traceback:\n" .. err)
  end
end

return config

-- vim: fdm=marker
