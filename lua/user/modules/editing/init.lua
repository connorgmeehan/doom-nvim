local editing = {}

editing.settings = {}

editing.packages = {
  ["vim-gnupg"] = { "jamessan/vim-gnupg" },
  ["nvim-lua-guide"] = { "nanotee/nvim-lua-guide" },
  ["vim-cool"] = { "romainl/vim-cool" }, -- disable highlights automatically on cursor move
  ["vim-surround"] = { "tpope/vim-surround" }, -- cs`' to change `` to '', etc
  ["vim-repeat"] = { "tpope/vim-repeat" },
  ["vim-stripper"] = { "itspriddle/vim-stripper" }, -- strip whitespace on save
  ["vim-line-no-indicator"] = { "drzel/vim-line-no-indicator" }, -- nice scroll indicator
  ["aerial.nvim"] = { "stevearc/aerial.nvim" },
  ["undotree"] = { "mbbill/undotree" }, -- visualize undo tree
  ["nvim-bqf"] = { "kevinhwang91/nvim-bqf" },
  ["focus.nvim"] = {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  ["vim-rooter"] = { "airblade/vim-rooter" },
  -- { 'oberblastmeister/nvim-rooter' },
  -- { 'ldelossa/litee.nvim', config = require('molleweide.plugins.litee') },
  -- { 'ldelossa/litee-calltree.nvim' },
  -- { 'ldelossa/litee-symboltree.nvim' },
  -- { 'ldelossa/litee-filetree.nvim' },
  -- { 'ldelossa/litee-bookmarks.nvim' },
  -- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end },
  -- https://github.com/sindrets/winshift.nvim
  -- { 'https://github.com/justinmk/vim-dirvish' },
  -- git@github.com:steelsojka/pears.nvim.git
  -- https://github.com/mg979/vim-visual-multi -- TODO: try this one.
  --		convert this one to lua
}

return editing
