-- [[
-- ]]

--- @class DoomPlugin

--- @type DoomPlugin
local module = {}

module.treesitter_parsers = { 'vue' }

module.language_servers = function(use_lsp, configure_lsp)
  -- Initialise multiple volar instances, same way coc/vscode provide vue3 support
  -- https://github.com/johnsoncodehk/volar/discussions/606
  print('vue3 language_servers executed')

  use_lsp('volar', {
    auto_start = false,
    on_ready = function (default_config)
      local lspconfig_util = require 'lspconfig/util'
      local volar_root_dir = lspconfig_util.root_pattern('package.json')

      local function on_new_config(new_config, new_root_dir)
        local function get_typescript_server_path(root_dir)
          local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
          return project_root and (lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js'))
            or ''
        end

        if
          new_config.init_options
          and new_config.init_options.typescript
          and new_config.init_options.typescript.serverPath == ''
        then
          new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
        end
      end

      local volar_api_config = vim.tbl_deep_extend('keep', default_config, {
        default_config = {
          root_dir = volar_root_dir,
          on_new_config = on_new_config,
          filetypes = { 'vue'},
          -- If you want to use Volar's Take Over Mode (if you know, you know)
          --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
          init_options = {
            typescript = {
              serverPath = ''
            },
            languageFeatures = {
              references = true,
              definition = true,
              typeDefinition = true,
              callHierarchy = true,
              hover = true,
              rename = true,
              renameFileRefactoring = true,
              signatureHelp = true,
              codeAction = true,
              workspaceSymbol = true,
              completion = {
                defaultTagNameCase = 'both',
                defaultAttrNameCase = 'kebabCase',
                getDocumentNameCasesRequest = false,
                getDocumentSelectionRequest = false,
              },
            }
          }
        }
      })
      local volar_api = configure_lsp('volar-api', volar_api_config)
      if volar_api.setup then
        volar_api.setup({})
      end

      local volar_doc_config = vim.tbl_deep_extend('keep', default_config, {
        default_config = {
          root_dir = volar_root_dir,
          on_new_config = on_new_config,

          filetypes = { 'vue'},
          -- If you want to use Volar's Take Over Mode (if you know, you know):
          --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
          init_options = {
            typescript = {
              serverPath = ''
            },
            languageFeatures = {
              documentHighlight = true,
              documentLink = true,
              codeLens = { showReferencesNotification = true},
              -- not supported - https://github.com/neovim/neovim/pull/14122
              semanticTokens = false,
              diagnostics = true,
              schemaRequestService = true,
            }
          }
        }
      })
      local volar_doc = configure_lsp('volar-doc', volar_doc_config)
      if volar_doc.setup then
        volar_doc.setup({})
      end

      local volar_html_config = {
        default_config = {
          root_dir = volar_root_dir,
          on_new_config = on_new_config,

          filetypes = { 'vue'},
          -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
          --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          init_options = {
            typescript = {
              serverPath = ''
            },
            documentFeatures = {
              selectionRange = true,
              foldingRange = true,
              linkedEditingRange = true,
              documentSymbol = true,
              -- not supported - https://github.com/neovim/neovim/pull/13654
              documentColor = false,
              documentFormatting = {
                defaultPrintWidth = 100,
              },
            }
          },
        }
      }
      local volar_html_merged = vim.tbl_deep_extend('keep', default_config, volar_html_config)
      local volar_html = configure_lsp('volar-html', volar_html_merged)
      if volar_html.setup then
        volar_html.setup({})
      end
    end
  })
end

return module
