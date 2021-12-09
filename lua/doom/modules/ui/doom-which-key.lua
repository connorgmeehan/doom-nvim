-- [[
-- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
-- ]]

--- @type DoomModule
local module = {}

module.config = function ()
  local wk = require("which-key")
  local presets = require("which-key.plugins.presets")

  -- Disable presets that doom nvim doesn't use
  presets.operators["gc"] = nil

  wk.setup({
    plugins = {
      marks = false,
      registers = false,
      presets = {
        operators = false,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = {
      d = "Delete",
      c = "Change",
      y = "Yank (copy)",
      ["g~"] = "Toggle case",
      ["gu"] = "Lowercase",
      ["gU"] = "Uppercase",
      [">"] = "Indent right",
      ["<lt>"] = "Indent left",
      ["zf"] = "Create fold",
      ["!"] = "Filter though external program",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    window = {
      padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
      border = "single",
    },
    layout = {
      height = { min = 1, max = 10 }, -- min and max height of the columns
      spacing = 3,
      align = "left",
    },
    ignore_missing = true,
    hidden = {
      "<silent>",
      "<Cmd>",
      "<cmd>",
      "<Plug>",
      "call",
      "lua",
      "^:",
      "^ ",
    }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
  })

  -- Trigger nest.nvim integration
  local doom_nest = require('doom.modules.core.doom-nest')
  doom_nest.on_integration_loaded('whichkey')
end

module.setup = function (use)
  use({
    "folke/which-key.nvim",
    commit = "d3032b6d3e0adb667975170f626cb693bfc66baa",
    config = module.config,
    opt = true, -- Lazy load via defer_fn, 
  })

  vim.defer_fn(function()
    vim.cmd([[
      PackerLoad which-key.nvim
    ]])
  end, 0)
end

module.keymaps = {
  -- WARN: Couldn't get whichkey to open properly, not sure if this is suitable
  { '<Space>', '<Nop>', 'Open WhichKey Menu', category = 'Editor', uid = 'open_whichkey' }
}

return module


