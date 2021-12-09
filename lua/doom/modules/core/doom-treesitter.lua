-- [[
-- Fast syntax highlight and grammar parser
--
-- This module consumes the `treesitter_parsers` field of a DoomModule.
-- Preconfigured parsers can be enabled. Example:
--
-- module.treesitter_parsers = { 'css', 'js', 'html' }
--
--
-- Or Custom configuration can be provided. Example:
--
-- module.treesitter_parsers = {
--   http = { ... install info and config ... }
-- }
--
-- ]]

--- @type DoomPlugin
local module = {}
module.config = function()
  local has_value = require("doom.utils").has_value
  local modules = require("doom.core.config.modules").modules
  local is_plugin_disabled = require("doom.utils").is_plugin_disabled

  local function get_ts_parsers(languages)
    local langs = {}

    for _, lang in ipairs(languages) do
      -- If the lang is config then add parsers for JSON, YAML and TOML
      if lang == "config" then
        table.insert(langs, "json")
        table.insert(langs, "yaml")
        table.insert(langs, "toml")
      else
        lang = lang:gsub("%s+%+lsp(%(%a+%))", ""):gsub("%s+%+lsp", ""):gsub("%s+%+debug", "")
        table.insert(langs, lang)
      end
    end

    -- Add TSX parser if TypeScript is enabled
    if has_value(langs, "typescript") then
      table.insert(langs, "tsx")
    end
    return langs
  end

  -- Get all of the treesitter_parsers from each doom_module and install them
  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  local module_utils = require('doom.utils.modules')
  module_utils.for_each_doom_module(function (doom_module)
    if doom_module.treesitter_parsers then
      for parser_name, parser_name_or_config in pairs(doom_module.treesitter_parsers) do
        local config = type(parser_name_or_config) == 'table' and parser_name_or_config or nil
        if config then
          parser_configs[parser_name] = config
          table.insert(modules.langs, parser_name)
        else
          table.insert(modules.langs, parser_name_or_config)
        end
      end
    end
  end)

  -- Set up treesitter for HTTP
  -- TODO: Move this into the doom-rest.lua config
  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
    },
  }
  if packer_plugins and packer_plugins["rest.nvim"] then
    table.insert(modules.langs, "http")
  end

  require("nvim-treesitter.configs").setup({
    ensure_installed = get_ts_parsers(modules.langs),
    highlight = { enable = true },
    autopairs = {
      enable = is_plugin_disabled("autopairs") and false or true,
    },
    indent = { enable = true },
    playground = { enable = true },
    tree_docs = { enable = true },
    context_commentstring = { enable = true },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "vue",
        "markdown",
      },
    },
  })

  --  Check if user is using clang and notify that it has poor compatibility with treesitter
  --  WARN: 19/11/2021 | issues: #222, #246 clang compatibility could improve in future
  vim.defer_fn(function()
    local log = require("doom.extras.logging")
    local utils = require("doom.utils")
    -- Matches logic from nvim-treesitter
    local compiler = utils.find_executable_in_path({
      vim.fn.getenv("CC"),
      "cc",
      "gcc",
      "clang",
      "cl",
      "zig",
    })
    local version = vim.fn.systemlist(compiler .. (compiler == "cl" and "" or " --version"))[1]

    if version:match("clang") then
      log.warn(
        "doom-treesitter:  clang has poor compatibility compiling treesitter parsers.  We recommend using gcc, see issue #246 for details.  (https://github.com/NTBBloodbath/doom-nvim/issues/246)"
      )
    end
  end, 1000)
end

module.setup = function(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    commit = vim.fn.has("nvim-0.6.0") == 1 and
      "a47df48e7d4232fd771f2537a4fb43f582c026c9"
     or "47cfda2c6711077625c90902d7722238a8294982",
    opt = true,
    run = ":TSUpdate",
    branch = vim.fn.has("nvim-0.6.0") == 1 and "master" or "0.5-compat",
    config = module.config,
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = "ce74852c36008b11dda451bfe6c2ed71c535152b",
    after = "nvim-treesitter",
  })
  -- TODO: Move to seperate module and switch to https://github.com/danymat/neogen
  use({
    "nvim-treesitter/nvim-tree-docs",
    commit = "864c2f5023fa7399aa084fd81c0e2f8dedfd32e3",
    after = "nvim-treesitter",
  })
  use({
    "windwp/nvim-ts-autotag",
    commit = "80d427af7b898768c8d8538663d52dee133da86f",
    after = "nvim-treesitter",
  })
end

return module

