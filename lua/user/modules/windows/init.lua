if require("doom.utils").is_module_enabled("whichkey") then
  return {
    binds = {
      "<leader>",
      name = "+prefix",
      {
        {
          "w",
          name = "+windows",
          {
            { "z", [[<esc><cmd>suspend<CR>]], name = "suspend vim" },
            -- { "S", [[<esc><CR>]], name = "solo window / close all others" }, -- nvim get windows > compare some idx/name > close match set
            -- { "move"}
            -- { "new/rm"}
          },
        },
      },
    },
  }
end
