local themes = {}

themes.settings = {}

themes.packages = {
  { "EdenEast/nightfox.nvim" },
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = false, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be clear
          -- In particular, when you set it to 'all', that means all avaliable groups
          -- example of akinsho/nvim-bufferline.lua
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },
        exclude = {}, -- table: groups you don't want to clear
      })
    end,
  },
  { "bluz71/vim-moonfly-colors" },
  { "bluz71/vim-nightfly-guicolors" },
  { "projekt0n/github-nvim-theme" },
  { "Pocco81/Catppuccino.nvim" },
  { "sainnhe/sonokai" },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.material_style = "palenight"
      vim.g.material_italic_comments = 1
      vim.g.material_italic_keywords = 1
      vim.g.material_italic_functions = 1
      vim.g.material_lsp_underline = 1
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_disable_italic_comment = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"
      vim.g.edge_style = "neon"
      vim.g.edge_enable_italic = 1
      vim.g.edge_disable_italic_comment = 0
      vim.g.edge_transparent_background = 0
      vim.g.embark_terminal_italics = 1
      vim.g.nightflyTransparent = 0
      vim.g.nvcode_termcolors = 256
      vim.o.background = "dark"
      vim.g.tokyonight_dev = false
      vim.g.tokyonight_style = "storm"
      vim.g.tokyonight_sidebars = {
        "qf",
        "vista_kind",
        "terminal",
        "packer",
        "spectre_panel",
        "NeogitStatus",
        "help",
      }
      vim.g.tokyonight_cterm_colors = false
      vim.g.tokyonight_terminal_colors = true
      vim.g.tokyonight_italic_comments = true
      vim.g.tokyonight_italic_keywords = true
      vim.g.tokyonight_italic_functions = false
      vim.g.tokyonight_italic_variables = false
      vim.g.tokyonight_transparent = true
      vim.g.tokyonight_hide_inactive_statusline = true
      vim.g.tokyonight_dark_sidebar = true
      vim.g.tokyonight_dark_float = true
      vim.g.tokyonight_colors = {}
      -- vim.g.tokyonight_colors = { border = "orange" }
      -- require("tokyonight").colorscheme()
      -- vim.cmd("colorscheme tokyonight") -- Put your favorite colorscheme here
    end,
  },
}

-- local options = {
--   dim_inactive = true,
-- }
-- local pallets = {
--   dawnfox = {
--     bg2 = "#F9EFEC",
--     bg3 = "#ECE3DE",
--     sel1 = "#EEF1F1",
--     sel2 = "#D8DDDD",
--   },
-- }
-- local specs = {}
-- local groups = {
--   TelescopeNormal = { fg = "fg0", bg = "bg0" },
--   TelescopePromptTitle = { fg = "pallet.green", bg = "bg1" },
--   TelescopePromptBorder = { fg = "bg1", bg = "bg1" },
--   TelescopePromptNormal = { fg = "fg1", bg = "bg1" },
--   TelescopePromptPrefix = { fg = "fg1", bg = "bg1" },
--
--   TelescopeResultsTitle = { fg = "pallet.green", bg = "bg2" },
--   TelescopeResultsBorder = { fg = "bg2", bg = "bg2" },
--   TelescopeResultsNormal = { fg = "fg1", bg = "bg2" },
--
--   TelescopePreviewTitle = { fg = "pallet.green", bg = "bg1" },
--   TelescopePreviewNormal = { bg = "bg1" },
--   TelescopePreviewBorder = { fg = "bg1", bg = "bg1" },
--   TelescopeMatching = { fg = "error" },
--   CursorLine = { bg = "sel1", link = "" },
-- }
-- require("nightfox").setup({
--   options = options,
--   pallets = pallets,
--   specs = specs,
--   groups = groups,
-- })

return themes
