return {
  binds = {
    -- [[ n | do something in normal mode | sn | "_dP ]],
    -- [[ v | copy text in paragraph      | n  | "_dP ]],
    { "p", '"_dP', mode = "v", options = { silent = false } },
    { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
    {
      "<C-l>v",
      '"zy:lua doom.moll.funcs.inspect(<c-r>z)<Left>',
      name = "inspect",
      options = { silent = false },
      mode = "v",
    },
    {
      "<C-l>i",
      [[:lua doom.moll.funcs.inspect(loadstring(doom.moll.funcs.get_visual_selection()))<CR>]],
      name = "print vis sel",
      options = { silent = true },
      mode = "v",
    },
  },
}
