-- [[
-- ]]

--- @class DoomPlugin

--- @type DoomPlugin
local module = {}

module.language_servers = function (install_lsp, configure_lsp)
  print('Configuring lua language servers')
  install_lsp('sumneko_lua')
  configure_lsp('sumneko_lua', require('lua-dev').setup({
    lspconfig = {
      settings = {
        Lua = {
          workspace = {
            preloadFileSize = 200,
          },
          diagnostics = {
            globals = { "packer_plugins" },
          },
        },
      },
    },
  }))
end

module.setup = function(use)
  use({
    "folke/lua-dev.nvim",
    commit = "6a7abb62af1b6a4411a3f5ea5cf0cb6b47878cc0",
    config = module.config,
    module = "lua-dev",
  })
end

return module

