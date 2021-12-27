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
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  local kind_icons = {
    Text = "   ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = " ﴲ ",
    Variable = "  ",
    Class = "  ",
    Interface = " ﰮ ",
    Module = "  ",
    Property = " ﰠ ",
    Unit = "  ",
    Value = "  ",
    Enum = " 練",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = " ﲀ ",
    Struct = " ﳤ ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
  }
  --- Given an LSP item kind, returns a nerdfont icon
  --- @param kind_type string LSP item kind
  --- @return string Nerdfont Icon
  local function get_kind_icon(kind_type)
    return kind_icons[kind_type]
  end

  --- Wraps nvim_replace_termcodes
  --- @param str string
  --- @return string
  local function replace_termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  --- Helper function to check what <Tab> behaviour to use
  --- @return boolean
  local function check_backspace()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,preview,noinsert",
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    formatting = {
      format = function(entry, item)
        item.kind = string.format("%s %s", get_kind_icon(item.kind), item.kind)
        item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snp]",
          buffer = "[Buf]",
          nvim_lua = "[Lua]",
          path = "[Path]",
        })[entry.source.name]
        item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
        return item
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      -- ["<ESC>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
        elseif check_backspace() then
          vim.fn.feedkeys(replace_termcodes("<Tab>"), "n")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-jump-prev"), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    },
  })
end

module.config_lsp_signature = function()
  -- Signature help
  local cfg = {
    bind = true,
    doc_lines = 10,
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    floating_window_above_cur_line = true,
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    -- hint_prefix = "🐼 ", -- Panda for parameter
    hint_prefix = " ",
    hint_scheme = "String",
    -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single", -- double, single, shadow, none
    },
    -- transpancy = 80,
    extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    debug = false, -- set to true to enable debug logging
    log_path = "debug_log_file_path", -- debug log path
    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  }
  require("lsp_signature").setup(cfg)
end

module.setup = function(use)
  use({
    "hrsh7th/nvim-cmp",
    commit = ("2e4270d02843d15510b3549354e238788ca07ca5"),
    -- wants = { "LuaSnip" },
    -- TODO: Handle these modules
    --[[ requires = {
      {
        "L3MON4D3/LuaSnip",
        commit = ("a54b21aee0423dbdce121c858ad6a88a58ef6e0f"),
        event = "BufReadPre",
        wants = "friendly-snippets",
        config = require("doom.modules.config.doom-luasnip"),
        disable = disabled_snippets,
        requires = { "rafamadriz/friendly-snippets" },
      },
      {
        "windwp/nvim-autopairs",
        commit = ("e6b1870cd2e319f467f99188f99b1c3efc5824d2"),
        config = require("doom.modules.config.doom-autopairs"),
        disable = disabled_autopairs,
        event = "BufReadPre",
      },
    }, ]]
    config = module.config,
    event = "InsertEnter",
  })
  use({
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-nvim-lsp",
    commit = "134117299ff9e34adde30a735cd8ca9cf8f3db81",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-buffer",
    commit = "a706dc69c49110038fe570e5c9c33d6d4f67015b",
    after = "nvim-cmp",
  })
  use({
    "saadparwaiz1/cmp_luasnip",
    commit = "16832bb50e760223a403ffa3042859845dd9ef9d",
    after = "nvim-cmp",
  })

  -- Manage Language serverss with ease.
  use({
    "williamboman/nvim-lsp-installer",
    commit = "4d4677739f52b4aeab8909548b37cc88479c315e",
    config = require('doom.modules.editor.doom-lsp.config'),
  })

  -- Show function signature when you type
  use({
    "ray-x/lsp_signature.nvim",
    commit = "c7b2b2e14b597c077804ae201f1ec9a7dac76ad0",
    config = module.config_lsp_signature,
    after = "nvim-lspconfig",
    event = "InsertEnter",
  })
end

module.keybinds = {
  { "K", vim.lsp.buf.hover, "Show hover doc", category = 'LSP', uid = 'lsp_hover_doc' },
  { "g", {
    { "d", vim.lsp.buf.definition, "Jump to definition", category = 'LSP', uid = 'lsp_jump_def' },
    { "r", vim.lsp.buf.references, "Jump to references", category = 'LSP', uid = 'lsp_jump_ref' },
    { "i", vim.lsp.buf.implementation, "Jump to implementation", category = 'LSP', uid = 'lsp_jump_impl' },
    { "a", vim.lsp.buf.code_action, "Code actions", category = 'LSP', uid = 'lsp_code_action' },
    { "d", vim.lsp.buf.hover, "Show hover doc", category = 'LSP', uid = 'lsp_hover_doc_alt' },
  }},
  { "<C-", {
    { "p>", vim.lsp.diagnostic.goto_prev, "Jump to prev diagnostic", category = 'LSP', uid = 'lsp_prev_diagnostic' },
    { "n>", vim.lsp.diagnostic.goto_next, "Jump to next diagnostic", category = 'LSP', uid = 'lsp_next_diagnostic' },
  }},
  { '<leader>c', name = '+Code', {
    { 'l', name = '+Lsp', {
      { 'r', vim.lsp.buf.rename, "Rename the reference under cursor", category = 'LSP', uid = 'lsp_rename_ref' },
      { 'q', vim.lsp.diagnostic.set_loclist, 'Diagnostics into location list', category = 'LSP', uid = 'lsp_diagnostics_list'},
      { 'l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false, border = "single" })<CR>', 'Show line diagnostics', category = 'LSP', uid = 'lsp_line_diagnostics'},
      { 'd', vim.lsp.buf.type_definition, 'Show type definition', category = 'LSP', uid = 'lsp_type_def'},
      { "a", vim.lsp.buf.code_action, "Code actions", category = 'LSP', uid = 'lsp_code_action_alt' },
      { "i", '<cmd>LspInfo<cr>', "Show LSP Info", category = 'LSP', uid = 'lsp_info' },
    }}
  }}
}

return module

