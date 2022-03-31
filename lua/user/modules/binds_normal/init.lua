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
--
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
  },
}
