return {
  binds = {
    { "<c-z>", [[<cmd>suspend<CR>]], name = "suspend vim" },
    { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
    { ";", ":", name = "colon", options = { silent = false } },
    { ":", ";", name = "semi-colon" },
    --  {'n', 'dl', ':set wrap! linebreak!<CR>'},
    -- { 'x', 'z', '<Plug>VSurround' },
    -- { 'n', 'yzz', '<Plug>Yssurround' }, -- double ss
    -- { 'n', 'yz', '<Plug>Ysurround' }, -- single s
    -- { 'n', 'dz', '<Plug>Dsurround' },
    -- { 'n', 'cz', '<Plug>Csurround' },
    -- -- -- search regex
    -- -- {'n', '/', '/\\v'}, -- need to esc backsl
    -- -- {'v', '/', '/\\v'},
  },
}
