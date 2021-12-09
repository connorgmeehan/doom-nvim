-- [[
-- Core module for managing keymap bindings + enabling integrations with nvim-mapper or whichkey.
--
-- This module consumes the `keymaps` field of a DoomModule.
-- Keymaps should be formatted using nest.nvim style bindings with extra fields for integrating with nvim-mapper and whichkey.nvim.
-- Check https://github.com/connorgmeehan/nest.nvim/tree/integrations-api#plugin-integrations for details
--
-- ]]

--- @class NestDoomPlugin : DoomPlugin
--- @field apply_keymap function
--- @field on_integration_loaded function

--- @type NestDoomPlugin
local module = {}

module.config = function ()
  -- Iterate across each doom module enabling the keybindings
  vim.g.mapleader = " "

  local module_utils = require('doom.utils.modules')
  local nest = require('nest');
  module_utils.for_each_doom_module(function (doom_module)
    if doom_module.keymaps then
      nest.applyKeymaps(doom_module.keymaps)
    end
  end)
end

module.setup = function(use)
  use({
    "connorgmeehan/nest.nvim",
    branch = 'integrations-api',
    config = module.config,
  })
end

-- Extended functionality of DoomPlugin

--- Exposes nest.applyKeymaps to rest of application
--- @param keymap table<number,table> Keymap object
--- @param integrations table<number, object> Optional, force only a specific integration
module.apply_keymap = function(keymap, integrations)
  require('nest').applyKeymaps(keymap, nil, integrations)
end

--- This needs to be called at the end of a DoomPlugin's config
--- to notify nest.nvim that it's ready to be integrated with.
--
--- @param integration_name string
module.on_integration_loaded = function(integration_name)
  -- Get the integration
  local integration = require('nest.integrations.'..integration_name)
  -- Enable it for future keymaps
  require('nest').enable(integration)

  -- Traverse all enabled doom_modules and run the integration against those keymap
  local module_utils = require('doom.utils.modules')
  module_utils.for_each_doom_module(function(doom_module)
    if doom_module.keymaps then
      module.apply_keymap(doom_module.keymaps, { integration })
    end
  end)
end

return module

