local surround = {}

surround.settings = {}

surround.packages = {
  ["vim-surround"] = { "tpope/vim-surround" }, -- cs`' to change `` to '', etc
}

-- surround.binds = {}

----------------------------
---       surround       ---
----------------------------

-- -- map ds       <Plug>Dsurround
-- -- nmap cs       <Plug>Csurround
-- -- nmap cS       <Plug>CSurround
-- -- nmap ys       <Plug>Ysurround
-- -- nmap yS       <Plug>YSurround
-- -- nmap yss      <Plug>Yssurround
-- -- nmap ySs      <Plug>YSsurround
-- -- nmap ySS      <Plug>YSsurround
-- -- xmap gs       <Plug>VSurround
-- -- xmap gS       <Plug>VgSurround
-- normal mode

-- table.insert(binds, {
--   { "<c-z>", [[<cmd>suspend<CR>]], name = "suspend vim" },
--   { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
--   { ";", ":", name = "colon", options = { silent = false } },
--   { ":", ";", name = "semi-colon" },
--   --  {'n', 'dl', ':set wrap! linebreak!<CR>'},
--   -- { 'x', 'z', '<Plug>VSurround' },
--   -- { 'n', 'yzz', '<Plug>Yssurround' }, -- double ss
--   -- { 'n', 'yz', '<Plug>Ysurround' }, -- single s
--   -- { 'n', 'dz', '<Plug>Dsurround' },
--   -- { 'n', 'cz', '<Plug>Csurround' },
--   -- -- -- search regex
--   -- -- {'n', '/', '/\\v'}, -- need to esc backsl
--   -- -- {'v', '/', '/\\v'},
-- })


return surround

