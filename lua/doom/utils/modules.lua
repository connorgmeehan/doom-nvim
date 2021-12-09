---[[---------------------------------------]]---
--         utils - Doom Nvim utilities         --
--              Author: NTBBloodbath           --
--              License: GPLv2                 --
---[[---------------------------------------]]---

local modules = {}

--- Can't be disabled
local core_modules = {
  core = {
    'nest', -- Used to bind keymaps for all doom_modules
    'treesitter' -- Syntax parsing
  }
}
-- Safelist of implemented modules, only modules in this list will actually be passed to the callback.
-- Temporary while we transition to new module api
local implemented_modules = {
  'nest',
  'treesitter',
  'neorg',
}
--- Iterates over all enabled DoomModule in doom_modules and passes them to a callback one by one
--- @param callback "function(doom_plugin) end"
modules.for_each_doom_module = function(callback)
  local utils = require('doom.utils')
  local user_modules = require("doom.core.config.modules").modules

  local do_for_module = function(doom_modules, callback2)
    for section_name, section in pairs(doom_modules) do
      for _, module_name in ipairs(section) do
        -- Only run modules that have been implemented
        if utils.has_value(implemented_modules, module_name) then
          local doom_module = require('doom.modules.' .. section_name .. '.doom-' .. module_name);
          callback2(doom_module)
        end
      end
    end
  end
  do_for_module(core_modules, callback)
  do_for_module(user_modules, callback)
end

--- Check if a Lua module exists
--- @param mod string The module name, e.g. nvim-treesitter
--- @return boolean
modules.is_module_available = function(mod)
  if package.loaded[mod] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(mod)
      if type(loader) == "function" then
        package.preload[mod] = loader
        return true
      end
    end
    return false
  end
end

--- Load the specified Lua modules
--- @param module_path string The path to Lua modules, e.g. 'doom' → 'lua/doom'
--- @param mods table The modules that we want to load
modules.load_modules = function(module_path, mods)
  for i = 1, #mods, 1 do
    local ok, err = xpcall(require, debug.traceback, string.format("%s.%s", module_path, mods[i]))
    if not ok then
      require("doom.extras.logging").error(
        string.format(
          "There was an error loading the module '%s.%s'. Traceback:\n%s",
          module_path,
          mods[i],
          err
        )
      )
    else
      require("doom.extras.logging").debug(
        string.format("Successfully loaded '%s.%s' module", module_path, mods[i])
      )
    end
  end
end

return modules
