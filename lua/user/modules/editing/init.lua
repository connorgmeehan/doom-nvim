local editing = {}

editing.settings = {}

editing.packages = {
  ["focus.nvim"] = {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  -- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end }, --???????????????
  -- https://github.com/sindrets/winshift.nvim
}

return editing
