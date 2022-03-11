local utils = require("doom.utils")
local system = require("doom.core.system")
local core_settings = require("doom.core.settings")
local user_settings = require("doom.core.config.settings")
local enabled_modules = require("doom.core.config.modules").modules
-- `core` is required, doom wouldn't make sense without it.

local config = {}
local filename = "config.lua"

config.source = nil
config.load = function()
  -- Set vim defaults on first load. To override these, the user can just
  -- override vim.opt in their own config, no bells or whistles attached.
  local first_load = vim.tbl_isempty(doom or {})
  if first_load then
    doom = vim.tbl_deep_extend("force", core_settings, user_settings)
    dofile(utils.find_config("options.lua", "lua/doom/core"))
    doom.packages = {} -- Extra packages
    doom.autocmds = {} -- Extra autocommands
    doom.binds = {} -- Extra binds
    doom.modules = {} -- Modules

    -- Combine core modules with user-enabled modules
    local all_modules = vim.tbl_deep_extend('keep', {
      core = {
        'core',
        'nest',
        'treesitter',
      }
    }, enabled_modules)

    for section_name, section_modules in pairs(all_modules) do
      for _, module_name in pairs(section_modules) do
        local ok, result = xpcall(require, debug.traceback, ("doom.modules.%s.%s"):format(section_name, module_name))
        if ok then
          doom.modules[module_name] = result
        else
          print(vim.inspect(result))
        end
      end
    end
  end

  dofile(config.source)

  -- Check plugins updates on start if enabled.
  if doom.check_updates then
    require("doom.core.functions").check_updates()
  end

  -- load vim options
  -- if first_load then
  -- end
end

-- Path cases:
--   1. stdpath('config')/../doom-nvim/config.lua
--   2. stdpath('config')/config.lua
--   3. <runtimepath>/doom-nvim/config.lua
config.source = utils.find_config(filename)

return config

-- vim: fdm=marker
