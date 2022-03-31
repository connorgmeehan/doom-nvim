local binds_regular = {}

local bind = doom.moll.bind
local enabled = true

local opts = {
  sf = { silent = false },
  n = { noremap = true },
}

-- set / get visual selection
local vs = '"zy'
local viw = '"zyiw'
local viW = '"zyiW'
local vg = "<c-r>z"

--
-- -- -- search regex
-- -- {'n', '/', '/\\v'}, -- need to esc backsl
-- -- {'v', '/', '/\\v'},

return {
  binds = {
    { "p", '"_dP', mode = "v", options = opts.fs },
    { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
    {
      "<C-l>v",
      vs .. ":lua doom.moll.funcs.inspect(" .. vg .. ")<Left>",
      name = "inspect",
      options = opts.sf,
      mode = "v",
    },
    {
      "<C-l>i",
      [[:lua doom.moll.funcs.inspect(loadstring(doom.moll.funcs.get_visual_selection()))<CR>]],
      name = "print vis sel",
      options = opts.sf,
      mode = "v",
    },
  },
}

-- - local binds_operator = {
-- { 'o', 'b', 'vb', opts.ns },
-- { 'o', 'B', 'vB', opts.ns },
-- { 'o', 'F', 'vF', opts.ns },
-- { 'o', 'T', 'vT', opts.ns },
-- -- { 'o', 's', '<Plug>Lightspeed_s', opts.n },
-- -- { 'o', 'S', '<Plug>Lightspeed_S', opts.ns },
-- }

-- -- insert
-- bind({
--   enabled,
--   insert = {
--     -- { "i", "zm", "<ESC>:w<cr>", opts_s, "Editor", "exit_insert", "Exit insert mode" },
--     { "zf", "<ESC>cF", mode = "i", name = "esc search back", options = { silent = true } },
--     -- { "i", "zt", "<ESC>cT", opts_s, "Editor", "exit_insert_till_bkw", "Exit insert mode and change Until Backwards" },
--     -- { "i", "zD", "<ESC>dF", opts_s, "Editor", "exit_insert_delete_bkw", "Exit insert mode and delete Backwards" },
--     -- { "i", "zh", "<ESC>yF", opts_s, "Editor", "exit_insert_yank_bkw", "Exit insert mode and yank Backwards" },
--     -- { "i", "zp", "<ESC>la", opts_s, "Editor", "exit_insert_and_append_tiny", "Exit Insert Mode and append right" },
--     -- { "i", "zP", "<ESC>A ", opts_s, "Editor", "exit_insert_and_append_big", "Exit Insert Mode and (A)ppend" },
--   },
-- })

-- local lsp_opts = vim.tbl_extend("force", opts.sf, { expr = true })
--
-- bind({ -- lsp
--   not enabled,
--   lsp = {
--     "<c-n>",
--     'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
--     "luasnip_expand",
--     options = lsp_opts,
--   },
--   --     "s", "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--   --     "s", "<c-p>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--   --     "s", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_s",
--   --     "s", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_s",
--   --     "i", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_i_insert",
--   --     "i", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_i_insert",
--   --     "i", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice",
--   --     "s", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice_s",
-- })
--
-- -- { 't', '<esc>', 'command', 'option'},
-- -- local binds_terminal = {
-- -- }
