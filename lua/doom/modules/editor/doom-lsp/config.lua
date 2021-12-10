return function ()
  local is_plugin_disabled = require("doom.utils").is_plugin_disabled
  local log = require("doom.extras.logging")

  -- Snippets support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.textDocument.codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = {
          "",
          "quickfix",
          "refactor",
          "refactor.extract",
          "refactor.inline",
          "refactor.rewrite",
          "source",
          "source.organizeImports",
        },
      },
    },
  }

  --- Intelligent highlighting of word under cursor
  local on_attach
  if not is_plugin_disabled("illuminated") and packer_plugins["vim-illuminate"] then
    on_attach = function(client)
      require("illuminate").on_attach(client)
      -- Set underline highlighting for Lsp references
      vim.cmd("hi! LspReferenceText cterm=underline gui=underline")
      vim.cmd("hi! LspReferenceWrite cterm=underline gui=underline")
      vim.cmd("hi! LspReferenceRead cterm=underline gui=underline")
    end
  end

  local capabilities_config = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  --- Default LSPs for languages
  local default_servers = {
    ansible = { "ansiblels" },
    angular = { "angularls" },
    bash = { "bashls" },
    -- bicep = { 'bicep' },
    c_sharp = { "omnisharp" },
    c = { "clangd" },
    cpp = { "clangd" },
    cmake = { "cmake" },
    css = { "cssls" },
    clojure = { "clojure_lsp" },
    -- codeql = { 'codeqlls' },
    -- deno = { 'denols' },
    -- dlang = { 'serve_d' },
    dockerfile = { "dockerls" },
    dot = { "dotls" },
    elixer = { "elixerls" },
    elm = { "elmls" },
    ember = { "ember" },
    fortran = { "fortls" },
    -- ['f#'] = { 'fsautocomplete' },
    go = { "gopls" },
    graphql = { "graphql" },
    groovy = { "groovyls" },
    html = { "html" },
    haskel = { "hls" },
    json = { "jsonls" },
    json5 = { "jsonls" },
    java = { "jdtls" },
    javascript = { "tsserver" },
    kotlin = { "kotlin_language_server" },
    latex = { "texlab" },
    ocaml = { "ocamells" },
    php = { "phpactor" },
    powershell = { "powershell_es" },
    -- prisma = { 'prismals' },
    -- puppet = { 'puppet' },
    -- purescript = { 'purescriptls' },
    python = { "pyright" },
    -- rescript = { 'rescriptls' },
    -- rome = { 'rome' },
    ruby = { "solargraph" },
    rust = { "rust_analyzer" },
    -- solang = { 'solang' },
    -- sorbet = { 'sorbet' },
    svelte = { "svelte" },
    typescript = { "tsserver" },
    -- vala = { 'valals' },
    vim = { "vimls" },
    vue = { "vuels" },
    xml = { "lemminx" },
    yaml = { "yamlls" },
    config = { "jsonls", "yamlls" },
  }
  local to_auto_start = {}
  local ensure_installed = {}


  local lsp_installer_servers = require'nvim-lsp-installer.servers'
  --- Flags an LSP to be installed
  --- @param lsp_name string Name of lsp from nvim-lsp-installer.
  --- @param opts table Configuration options
  local use_lsp_callback = function (lsp_name, opts)
    ensure_installed[lsp_name] = true
    local auto_start = opts.auto_start == nil and true or opts.auto_start
    if auto_start then
      to_auto_start[lsp_name] = true
    end
    -- If on_ready function is passed
    if opts.on_ready then
      local ok, server = lsp_installer_servers.get_server(lsp_name)
      if ok then
        server:on_ready(function ()
          local lsp_installer_config = {
            default_config = server:get_default_options()
          }

          local default_config = vim.tbl_deep_extend('keep', lsp_installer_config, capabilities_config)
          opts.on_ready(default_config)
        end)
      end
    end
  end

  --- Adds a configuration to lspconfig, returns the config from lspconfig.
  --- @param lsp_config_name string Name of lsp, used as key.
  --- @param config table Configuration
  --- @return 
  local configure_lsp_callback = function(lsp_config_name, config)
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig/configs'
    configs[lsp_config_name] = config
    return lspconfig[lsp_config_name]
  end

  -- Iterate over doom_modules, handle the .language_servers field to be saved for later
  local module_utils = require('doom.utils.modules')
  module_utils.for_each_doom_module(function (doom_module)
    if doom_module.language_servers then

      local field_type = type(doom_module.language_servers)
      if field_type == 'function' then
        doom_module.language_servers(use_lsp_callback, configure_lsp_callback)
      elseif field_type == 'table' then
        for _, lsp_name in ipairs(doom_module.language_servers) do
          use_lsp_callback(lsp_name)
        end
      end
    end
  end)

  -- Figure out which servers need to be uninstalled
  local utils = require("doom.utils")
  local all_servers = utils.tbl_dedupe(vim.tbl_flatten(vim.tbl_values(default_servers)))
  local ensure_uninstalled = vim.tbl_filter(function(lsp_name)
    return not vim.tbl_contains(ensure_installed, lsp_name)
  end, all_servers)

  -- Store which servers were installed/uninstalled in these tables
  local installing_servers = {}
  local uninstalling_servers = {}


  -- Uninstall servers
  for _, lsp_name in ipairs(ensure_uninstalled) do
    local ok, server = lsp_installer_servers.get_server(lsp_name)
    if ok and server:is_installed() then
      server:uninstall()
      log.info("doom-lsp: Uninstalling server " .. lsp_name .. ".")
      table.insert(uninstalling_servers, lsp_name)
    end
  end

  -- Install and start servers
  print('installing servers')
  for _, lsp_name in ipairs(vim.tbl_keys(ensure_installed)) do
    local ok, server = lsp_installer_servers.get_server(lsp_name)
    if ok then
      if not server:is_installed() then
        server:install()
        log.info("doom-lsp: Installing server " .. lsp_name .. ".")
        table.insert(installing_servers, lsp_name)
      end

      print(lsp_name .. ' auto start? ' .. (to_auto_start[lsp_name] and 'true' or 'false'))
      if to_auto_start[lsp_name] then
        server:on_ready(function ()
          server:setup(capabilities_config)
        end)
      end
    end
  end


  -- TODO: Also handle default behaviour
  -- Fallback behaviour for languages without their own doom_module
  --- @param language_string string
  local handle_language_default_behaviour = function(language_string)
    if not language_string:find('+lsp') then
      return
    end

    local lang_name = language_string:match('%w+')
    local lsp_override = language_string:match("+lsp%((.+)%)")

    local lang_lsps = lsp_override ~= nil
      and vim.split(lsp_override, ",")
      or default_servers[lang_name]

    if lang_lsps then
      lang_lsps = vim.tbl_map(function(v) vim.trim(v) end)
      for _, lsp_name in ipairs(lang_lsps) do
        use_lsp_callback(lsp_name)
      end
    end
  end

end
