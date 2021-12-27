---[[-----------------]]---
--    LSP Keybindings    --
---]]-----------------[[---

local mappings = require("doom.utils.mappings")
local check_plugin = require("doom.utils").check_plugin

local opts = { silent = true }
local lsp_opts = vim.tbl_extend("force", opts, { expr = true })

-- LuaSnip mappings
if check_plugin("LuaSnip", "opt") then
  mappings.map(
    "n",
    "<Tab>",
    'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
    lsp_opts,
    "Snippets",
    "luasnip_expand",
    "Expand snippet"
  )
  mappings.map(
    "i",
    "<S-Tab>",
    '<cmd>lua require("luasnip").jump(-1)<CR>',
    opts,
    "Snippets",
    "luasnip_prev_sel",
    "Previous snippet"
  )

  mappings.map(
    "s",
    "<Tab>",
    '<cmd>lua require("luasnip").jump(1)<CR>',
    opts,
    "Snippets",
    "luasnip_next_sel",
    "Next snippet"
  )
  mappings.map(
    "s",
    "<S-Tab>",
    '<cmd>lua require("luasnip").jump(-1)<CR>',
    opts,
    "Snippets",
    "luasnip_prev_sel_s",
    "Previous snippet (Select mode)"
  )

  mappings.map(
    "i",
    "<C-E>",
    'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
    lsp_opts,
    "Snippets",
    "luasnip_next_choice",
    "Next snippets field"
  )
  mappings.map(
    "s",
    "<C-E>",
    'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
    lsp_opts,
    "Snippets",
    "luasnip_next_choice_s",
    "Next snippet field"
  )
end
