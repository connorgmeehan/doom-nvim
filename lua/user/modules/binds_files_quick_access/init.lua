local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled
local paths = require("user.utils").paths

if is_module_enabled("whichkey") then
  return {
    binds = {
      "<leader>",
      name = "+prefix",
      {
        {
          "M",
          name = "+moll",
          {
            {
              "g",
              name = "+go",
              {
                { "D", "<cmd>e " .. paths.doom_log_path .. "<CR>" },
                -- { "N", "<cmd>e " .. paths.notes_rndm .. "<CR>" },
                { "S", "<cmd>e " .. paths.conf_skhd .. "<CR>" },
                { "a", "<cmd>e " .. paths.conf_alac .. "<CR>" },
                { "d", "<cmd>e " .. paths.conf_doom .. "<CR>" },
                { "e", "<cmd>e " .. paths.conf_setup .. "<CR>" },
                { "g", "<cmd>e " .. paths.aliases_git .. "<CR>" },
                { "m", "<cmd>e " .. paths.conf_tnx_main .. "<CR>" },
                -- { "n", "<cmd>e " .. paths.notes_todo .. "<CR>" },
                { "s", "<cmd>e " .. paths.conf_surf .. "<CR>" },
                { "t", "<cmd>e " .. paths.conf_tmux .. "<CR>" },
                { "x", "<cmd>e " .. paths.conf_scim .. "<CR>" },
                { "y", "<cmd>e " .. paths.conf_yabai .. "<CR>" },
                { "z", "<cmd>e " .. paths.aliases_zsh .. "<CR>" },
              },
            }, -- moll > go
          },
        },
      },
    },
  }
end
