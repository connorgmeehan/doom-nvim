local misc = {}

misc.settings = {}

misc.packages = {
  ["vim-tmux-navigator"] = { "christoomey/vim-tmux-navigator" },
  ["vim-tmux-resizer"] = { "melonmanchan/vim-tmux-resizer" },
  ["vimux"] = { "benmills/vimux" },
  ["tabular"] = { "godlygeek/tabular" },
  ["excel.vim"] = { "vim-scripts/excel.vim" },
  ["ExcelLikeVim"] = { "kjnh10/ExcelLikeVim" },
  ["vim-be-good"] = { "ThePrimeagen/vim-be-good" },
  ["vCoolor.vim"] = { "KabbAmine/vCoolor.vim" }, -- open color picker / requires mouse to select color
  ["venn.nvim"] = { "jbyuki/venn.nvim", config = require("molleweide.configs.venn") },
  ["nabla.nvim"] = { "jbyuki/nabla.nvim" }, -- , config = require("molleweide.configs.nabla")
  ["quickmath.nvim"] = { "jbyuki/quickmath.nvim" }, -- calculator
  -- use { 'rajasegar/vim-search-web' } -- fast looku
  -- { 'saifulapm/chartoggle.nvim' },
  -- { "AndrewRadev/switch.vim" },
  -- { "jszakmeister/vim-togglecursor" },
  -- { "Yohannfra/Vim-Flip.git" },
  -- { "elentok/togglr.vim.git" },
}

return misc
