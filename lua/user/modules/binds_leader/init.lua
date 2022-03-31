local binds_leader = {}

local log = require("doom.utils.logging")
local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled

local bind = doom.moll.bind
local enabled = true

local opts = {
  sf = { silent = false },
  n = { noremap = true },
}

local xdg_cfg = "$XDG_CONFIG_HOME/dorothy/config.xdg/"
local home_notes = "$HOME/notes/"
local doom_log_path = "$HOME/.local/share/nvim/doom.log"
local aliases_git =
  "$XDG_DATA_HOME/antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh"
local aliases_zsh = "$XDG_CONFIG_HOME/dorothy/sources/aliases.sh"
local conf_doom = "$XDG_CONFIG_HOME/dorothy/config.xdg/doom-nvim/doom_config.lua"
local conf_scim = "$XDG_CONFIG_HOME/dorothy/config.xdg/sc-im/scimrc"
local conf_setup = "$XDG_CONFIG_HOME/dorothy/config/setup.bash"
local conf_alac = xdg_cfg .. "alacritty/alacritty.yml"
local conf_surf = xdg_cfg .. "surfingkeys/config.js"
local conf_skhd = xdg_cfg .. "skhd/skhdrc"
local conf_tmux = xdg_cfg .. "tmux/tmux.conf"
local conf_tnx_main = xdg_cfg .. "tmuxinator/main.yml"
local conf_yabai = xdg_cfg .. "yabai/yabairc"
local notes_rndm = home_notes .. "RNDM.norg"
local notes_todo = home_notes .. "TODO.md"

-- set / get visual selection
local vs = '"zy'
local viw = '"zyiw'
local viW = '"zyiW'
local vg = "<c-r>z"

-- if is_module_enabled("whichkey") then
binds_leader.binds = {
  "<leader>",
  name = "+prefix",
  {
    -- {
    --     "h", name = "+help", {
    --       -- { "n", "<leader>hm", ":Man ", { silent = false }, "Man Page", "man_page", "Man Page" },
    --       -- { "n", "<leader>hl", ":help lua_reference_toc<CR>", { silent = false }, "Lua Reference", "lua_reference", "Lua Reference" },
    --       -- { "n", "<leader>hw", "\"zyiw:h <c-r>z<cr>", { silent = false }, "Help Inner Word", "help_inner_word", "Inner Word" },
    --       -- { "n", "<leader>hh", ":help ", { silent = false }, "Help", "help", "Help" },
    --       -- { "n", "<leader>hc", "<cmd>helpc<cr>", { silent = false }, "Close Help", "close_help", "Close Help" },
    --     }
    --   }, -- help
    -- {
    --     "n", name = "neorg", {
    --       -- { 'n', '<leader>nd', ':Neorg workspace default_workspace<cr>', opts.n },
    --       -- { 'n', '<leader>nn', ':Neorg workspace notes<cr>', opts.n },
    --       -- { 'n', '<leader>nG', ':Neorg workspace gtd<cr>', opts.n },
    --       -- { 'n', '<leader>nE', ':Neorg workspace example_gtd<cr>', opts.n },
    --       -- { 'n', '<leader>ng', ':Neorg gtd ', opts.n },
    --       -- { 'n', '<leader>nc', ':Neorg gtd capture<cr>', opts.n },
    --       -- { 'n', '<leader>ne', ':Neorg gtd edit', opts.n },
    --       -- { 'n', '<leader>nv', ':Neorg gtd views<cr>', opts.n },
    --     }
    --   }, -- neorg -> move to leader > open > neorg
    {
      "M",
      name = "+moll",
      {
        {
          "l",
          [[<cmd>lua require("luasnip_snippets").load_snippets()<CR>]],
          name = "load luasnip-snippets",
        },
        { "r", [[<cmd>DoomReload<CR>]], name = "doomReload" },
        {
          "R",
          function()
            doom.moll.funcs.report_an_issue()
          end,
          name = "create_issue_from_templ",
        },
        {
          "p",
          [[:lua doom.moll.funcs.inspect(doom.)<Left>]],
          name = "inspect",
          options = opts.sf,
        },
        {
          "P",
          [[:lua doom.moll.funcs.inspect()<Left>]],
          name = "inspect",
          options = opts.sf,
        },
        {
          "w",
          '"zyiw:lua doom.moll.funcs.inspect(<c-r>z)<Left>',
          name = "inspect iw",
          options = opts.sf,
        },
        {
          "W",
          '"zyiW:lua doom.moll.funcs.inspect(<c-r>z)<Left>',
          name = "inspect iW",
          options = opts.sf,
        },
        { "t", '<cmd>TermExec cmd="zsh -il"<cr>', name = "terminal zsh -il" },
        -- {
        --     "e", name = "+TEST", {
        --       -- -- https://github.com/jbyuki/nabla.nvim#usage
        --       -- { 'n', '<F5>', '<cmd>lua require("nabla").action()<cr>', opts.n },
        --       -- { 'n', '<leader>Tp', '<cmd>lua require("nabla").popup()<cr>', opts.n },
        --       -- -- vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
        --       -- { 'n', '<leader>N', ':lua toggle_venn()<CR>', opts.n },
        --           --       -- require("plenary.reload").reload_module(selection.value)
        --           -- -- { 'n', '<leader>lr', ':lua require("telescope.builtin").reloader({ cwd = ' .. test_plugin_reload .. '})<cr>', opts.n },
        --           -- { 'n', '<leader>lr', ':lua require("plenary.reload").reload_module(' .. test_plugin_reload .. ')<cr>', opts.n },
        --           -- { 'n', '<leader>lR', ':lua report_an_issue()<cr>', opts.n },
        --           -- { 'n', '<leader>lp', ':lua pp()<left>', opts.n },
        --
        --     }
        --   },
        {
          "g",
          name = "+go",
          {
            { "D", "<cmd>e " .. doom_log_path .. "<CR>" },
            { "N", "<cmd>e " .. notes_rndm .. "<CR>" },
            { "S", "<cmd>e " .. conf_skhd .. "<CR>" },
            { "a", "<cmd>e " .. conf_alac .. "<CR>" },
            { "d", "<cmd>e " .. conf_doom .. "<CR>" },
            { "e", "<cmd>e " .. conf_setup .. "<CR>" },
            { "g", "<cmd>e " .. aliases_git .. "<CR>" },
            { "m", "<cmd>e " .. conf_tnx_main .. "<CR>" },
            { "n", "<cmd>e " .. notes_todo .. "<CR>" },
            { "s", "<cmd>e " .. conf_surf .. "<CR>" },
            { "t", "<cmd>e " .. conf_tmux .. "<CR>" },
            { "x", "<cmd>e " .. conf_scim .. "<CR>" },
            { "y", "<cmd>e " .. conf_yabai .. "<CR>" },
            { "z", "<cmd>e " .. aliases_zsh .. "<CR>" },
          },
        }, -- moll > go
        -- {
        --     "L", name = "+line operations", {
        --       -- -- line operations (testing)
        --       -- -- " run current line through shell
        --       -- { 'n', ',Zs', '!!$SHELL <CR>'},
        --       -- -- " run current line in commandline
        --       -- { 'n', ',Zl', 'yy:@" <CR>' },
        --       -- ??
        --       -- { 'n', ',ZZ', ':w !sudo tee %'},
        --     }
        --   }
      },
    }, -- moll
    -- {
    --     "P", name ="+path", { -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
    -- -- - file path to global
    -- -- - file git root global nvim
    -- -- - active file buffer
    -- -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
    -- { "n", "<leader>fpa", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_active_file", ":cd active file" },
    -- { "n", "<leader>fpg", "<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_current_git_root", ":cd active git root" },
    --       -- {
    --       -- 	"n",
    --       -- 	"<leader>fpa",
    --       -- 	"<cmd>cd %:p:h<CR><cmd>pwd<CR>",
    --       -- 	opts.s,
    --       -- 	"Editor",
    --       -- 	"cwd_to_active_file",
    --       -- 	":cd active file",
    --       -- },
    --       -- {
    --       -- 	"n",
    --       -- 	"<leader>fpg",
    --       -- 	"<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>",
    --       -- 	opts.s,
    --       -- 	"Editor",
    --       -- 	"cwd_to_current_git_root",
    --       -- 	":cd active git root",
    --       -- },
    --     }
    --   },
    {
      "s",
      name = "+search",
      {
        { "g", [[<cmd>Telescope repo cached_list<CR>]], name = "repos cached" },
        { "G", [[<cmd>Telescope repo list<CR>]], name = "repos build" },
        { "f", [[/\v\c]], name = "text case", options = opts.sf },
        {
          "r",
          name = "+replace",
          {
            { "l", ":s//g<Left><Left>", name = "line", options = opts.sf },
            { "L", '"zyiw:s/<c-r>z//g<Left><Left>', name = "line iw", options = opts.sf },
            { "o", '"zyiW:s/<c-r>z//g<Left><Left>', name = "line iW", options = opts.sf },
            {
              "O",
              '"zyiw:s/\\<<c-r>z\\>//g<Left><Left>',
              name = "line iw solo",
              options = opts.sf,
            },
            { "a", ":%s//g<Left><Left>", name = "file", options = opts.sf },
            { "w", '"zyiw:%s/<c-r>z//g<Left><Left>', name = "word", options = opts.sf },
            --
            -- {
            --    "n",
            --    "<leader>rfs",
            --    "\"zyiw:%s/\\<<c-r>z\\>//g<Left><Left>",
            --    { silent = false },
            --    "Replace Inner (w)ord Solo",
            --    "replace_inner_word_solo",
            --    "Replace (w)ord Solo"
            -- },
            -- {
            --    "n",
            --    "<leader>rfW",
            --    "\"zyiW:%s/<c-r>z//g<Left><Left>",
            --    { silent = false },
            --    "Replace Inner (W)ord",
            --    "replace_inner_word_big",
            --    "Replace (W)ord"
            -- },
          },
        }, -- search > replace
        {
          "R",
          name = "+grep/cdo",
          {
            -- -- ripgrep search empty
            -- {
            --    "n",
            --    "<leader>rg",
            --    ":grep ",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },
            -- -- ripgrep search word
            -- {
            --    "n",
            --    "<leader>rw",
            --    "\"zyiw:grep <c-r>z",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },
            -- -- ripgrep search WORD
            -- {
            --    "n",
            --    "<leader>rW",
            --    "\"zyiW:grep <c-r>z",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },

            -- -- TODO: add vimgrep variants
            -- -- vimgrep search empty
            -- {
            --    "n",
            --    "<leader>rg",
            --    ":grep ",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },
            -- -- vimgrep search word
            -- {
            --    "n",
            --    "<leader>rw",
            --    "\"zyiw:grep <c-r>z",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },
            -- -- vimgrep search WORD
            -- {
            --    "n",
            --    "<leader>rW",
            --    "\"zyiW:grep <c-r>z",
            --    { silent = false },
            --    "Ripgrep Search Empty",
            --    "ripgrep_search_empty",
            --    "Ripgrep Search Empty"
            -- },
            -- -- vimgrep search word solo
            -- -- vimgrep search WORD solo
            -- -- :cdo empty
            -- {
            --    "n",
            --    "<leader>rce",
            --    ":cdo s//gc<Left><Left><Left>",
            --    { silent = false },
            --    "Quickfix cdo Empty",
            --    "quickfix_cdo_empty",
            --    "Quickfix cdo Empty"
            -- },
            -- -- :cdo replace word
            -- {
            --    "n",
            --    "<leader>rcw",
            --    "\"zyiw:cdo s/<c-r>z//gc<Left><Left><Left>",
            --    { silent = false },
            --    "Quickfix cdo (w)ord",
            --    "quickfix_cdo_word_small",
            --    "Quickfix cdo (w)ord",
            -- },
            -- -- :cdo replace WORD
            -- {
            --    "n",
            --    "<leader>rcW",
            --    "\"zyiW:cdo s/<c-r>z//gc<Left><Left><Left>",
            --    { silent = false },
            --    "Quickfix cdo (W)ord",
            --    "quickfix_cdo_word_big",
            --    "Quickfix cdo (W)ord",
            -- },
            -- -- :cdo solo word
            -- {
            --    "n",
            --    "<leader>rcs",
            --    "\"zyiw:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
            --    { silent = false },
            --    "Quickfix cdo solo (w)ord",
            --    "quickfix_cdo_solo_word_small",
            --    "Quickfix cdo solo(w)ord",
            -- },
            -- -- :cdo solo WORD
            -- {
            --    "n",
            --    "<leader>rcS",
            --    "\"zyiW:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
            --    { silent = false },
            --    "Quickfix cdo solo (W)ord",
            --    "quickfix_cdo_solo_word_big",
            --    "Quickfix cdo solo (W)ord",
            -- },
          },
        },
      },
    }, -- search
    {
      "g",
      name = "+git",
      {
        {
          "z",
          name = "+octo",
          {
            { "i", ":Octo issue ", name = "issue", options = opts.sf },
            { "l", "<cmd>Octo issue list<cr>", name = "issue list" },
          },
        }, -- git -> octo
        -- {
        --     "x", name = "+vgit", {
        --
        --     }
        --   }, -- git -> vgit
        -- {
        --     "Z", name = "+gitsigns", {
        --
        --     }
        --   }, -- git -> gitsigns
        -- {
        --     "d", name = "+diffview", {
        --
        --     }
        --   }, -- git -> gitsigns
      },
    }, -- git
    -- {
    --     "R", "+readf", {
    --       -- -- read file
    --       -- -- :r file               to after cursor
    --       -- -- :$r                   to end of buffer
    --       -- -- :0r                   to end of buffer
    --       -- -- :{x}r                 to after line x
    --       -- -- :/pattern/r file      to after pattern
    --       -- { 'n', ',Rf', ':r<space>' },
    --       -- { 'n', ',Re', ':$r<space>' },
    --       -- { 'n', ',Rb', ':0r<space>' },
    --       -- { 'n', ',Rl', ':r <Left><Left>' },
    --       -- { 'n', ',Rp', '://r <Left><Left><Left>' },
    --     }
    --   }, -- read
    {
      "w",
      name = "+windows",
      {
        { "z", [[<esc><cmd>suspend<CR>]], name = "suspend vim" },
        -- { "S", [[<esc><CR>]], name = "solo window / close all others" }, -- nvim get windows > compare some idx/name > close match set
        -- { "move"}
        -- { "new/rm"}
        -- {
        --     "t", name = "+tabs", {
        --       -- { 'n', ',tn', ':tabnew<cr>' },
        --       -- { 'n', 'gl', 'gt' },
        --       -- { 'n', 'gL', 'gT' },
        --       -- { 'n', ',g0', ':tabr<cr>' },
        --       -- { 'n', ',g$', ':tabl<cr>' },
        --       -- { 'n', ',gh', ':tabm -<cr>' },
        --       -- { 'n', ',gl', ':tabm +<cr>' },
        --     }
        --   }
      },
    }, -- windows
  }, -- leader
}
-- end

return binds_leader