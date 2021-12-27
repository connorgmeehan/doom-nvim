-- [[
-- ]]

--- @class DoomPlugin

--- @type DoomPlugin
local module = {}

module.treesitter_parsers = { 'scala' }
module.language_servers = function (install_lsp, configure_lsp)
  configure_lsp('metals', require('lspconfig.server_configurations.metals'))
end

return module

