local editing = {}

editing.settings = {}

editing.packages = {
  ["vim-cool"] = { "romainl/vim-cool" }, -- disable highlights automatically on cursor move
  ["vim-surround"] = { "tpope/vim-surround" }, -- cs`' to change `` to '', etc
  ["vim-repeat"] = { "tpope/vim-repeat" },
  ["vim-stripper"] = { "itspriddle/vim-stripper" }, -- strip whitespace on save
  ["vim-line-no-indicator"] = { "drzel/vim-line-no-indicator" }, -- nice scroll indicator
  ["aerial.nvim"] = { "stevearc/aerial.nvim" },
  ["nvim-bqf"] = { "kevinhwang91/nvim-bqf" },
  ["focus.nvim"] = {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  ["vim-rooter"] = { "airblade/vim-rooter" },
  -- { 'oberblastmeister/nvim-rooter' },
  -- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end },
  -- https://github.com/sindrets/winshift.nvim
  -- { 'https://github.com/justinmk/vim-dirvish' },
  -- git@github.com:steelsojka/pears.nvim.git
  -- https://github.com/mg979/vim-visual-multi -- TODO: try this one.
  --		convert this one to lua
}

return editing
