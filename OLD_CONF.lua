-- idea > use :[range]luado to filter visual selection.
bind { -- visual
  enabled,
  visual = {
  { "p", '"_dP', mode = "v", options = opts.fs },
  { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
  { "<C-l>v", vs .. ":lua doom.moll.funcs.inspect(".. vg .. ")<Left>", name = "inspect", options = opts.sf, mode = "v" },
  {
      "<C-l>i",
      [[:lua doom.moll.funcs.inspect(loadstring(doom.moll.funcs.get_visual_selection()))<CR>]],
      name = "print vis sel",
      options = opts.sf, mode = "v",
    },
  }
}

-- insert
bind {
  true,
  insert = {
  -- { "i", "zm", "<ESC>:w<cr>", opts_s, "Editor", "exit_insert", "Exit insert mode" },
  { "zf", "<ESC>cF", mode ="i", name = "esc search back", opts.s },
-- { "i", "zt", "<ESC>cT", opts_s, "Editor", "exit_insert_till_bkw", "Exit insert mode and change Until Backwards" },
-- { "i", "zD", "<ESC>dF", opts_s, "Editor", "exit_insert_delete_bkw", "Exit insert mode and delete Backwards" },
-- { "i", "zh", "<ESC>yF", opts_s, "Editor", "exit_insert_yank_bkw", "Exit insert mode and yank Backwards" },
-- { "i", "zp", "<ESC>la", opts_s, "Editor", "exit_insert_and_append_tiny", "Exit Insert Mode and append right" },
-- { "i", "zP", "<ESC>A ", opts_s, "Editor", "exit_insert_and_append_big", "Exit Insert Mode and (A)ppend" },
  }
}

local lsp_opts = vim.tbl_extend("force", opts.sf, { expr = true })

bind { -- lsp
  disabled,
  lsp = { "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', "luasnip_expand", options = lsp_opts }
--     "s", "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--     "s", "<c-p>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--     "s", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_s",
--     "s", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_s",
--     "i", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_i_insert",
--     "i", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_i_insert",
--     "i", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice",
--     "s", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice_s",
}

-- { 't', '<esc>', 'command', 'option'},
-- local binds_terminal = {
-- }

if not is_plugin_disabled("whichkey") then
  bind {
    enabled,
    leader = {
      "<leader>", name = "+prefix", {
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
          "M", name = "+moll", {
          { "l", [[<cmd>lua require("luasnip_snippets").load_snippets()<CR>]], name = "load luasnip-snippets" },
          { "r", [[<cmd>DoomReload<CR>]], name = "doomReload" },
          { "R", function() doom.moll.funcs.report_an_issue() end, name = "create_issue_from_templ"},
          { "p", [[:lua doom.moll.funcs.inspect(doom.)<Left>]], name = "inspect", options = opts.sf },
          { "P", [[:lua doom.moll.funcs.inspect()<Left>]], name = "inspect", options = opts.sf },
          { "w", "\"zyiw:lua doom.moll.funcs.inspect(<c-r>z)<Left>", name = "inspect iw", options = opts.sf },
          { "W", "\"zyiW:lua doom.moll.funcs.inspect(<c-r>z)<Left>", name = "inspect iW", options = opts.sf },
          { 't', '<cmd>TermExec cmd="zsh -il"<cr>', name ="terminal zsh -il" },
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
              "g", name = "+go", {
              { 'D', '<cmd>e '.. doom_log_path ..'<CR>' },
              { 'N', '<cmd>e '.. notes_rndm ..'<CR>' },
              { 'S', '<cmd>e '.. conf_skhd ..'<CR>' },
              { 'a', '<cmd>e '.. conf_alac ..'<CR>' },
              { 'd', '<cmd>e '.. conf_doom ..'<CR>' },
              { 'e', '<cmd>e '.. conf_setup ..'<CR>' },
              { 'g', '<cmd>e '.. aliases_git ..'<CR>' },
              { 'm', '<cmd>e '.. conf_tnx_main ..'<CR>' },
              { 'n', '<cmd>e '.. notes_todo ..'<CR>' },
              { 's', '<cmd>e '.. conf_surf ..'<CR>' },
              { 't', '<cmd>e '.. conf_tmux ..'<CR>' },
              { 'x', '<cmd>e '.. conf_scim ..'<CR>' },
              { 'y', '<cmd>e '.. conf_yabai ..'<CR>' },
              { 'z', '<cmd>e '.. aliases_zsh ..'<CR>' },
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
          "s", name = "+search", {
          { "g", [[<cmd>Telescope repo cached_list<CR>]], name = "repos cached" },
          { "G", [[<cmd>Telescope repo list<CR>]], name = "repos build" },
          { "f", [[/\v\c]], name = "text case", options = opts.sf },
          {
              "r", name = "+replace", {
              { "l", ":s//g<Left><Left>", name = "line", options = opts.sf },
              { "L", "\"zyiw:s/<c-r>z//g<Left><Left>", name = "line iw", options = opts.sf },
              { "o", "\"zyiW:s/<c-r>z//g<Left><Left>", name = "line iW", options = opts.sf },
              { "O", "\"zyiw:s/\\<<c-r>z\\>//g<Left><Left>", name = "line iw solo", options = opts.sf },
              { "a", ":%s//g<Left><Left>", name = "file", options = opts.sf },
              { "w", "\"zyiw:%s/<c-r>z//g<Left><Left>", name = "word", options = opts.sf },
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
              }
            }, -- search > replace
          {
              "R", name = "+grep/cdo", {
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
              }
            }
          },
        }, -- search
      {
          "g", name = "+git", {
          {
              "z", name = "+octo", {
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
          "w", name = "+windows", {
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
      } -- leader
    }
  }
end

---------------------------
---------------------------
---------------------------
---       PLUGINS       ---
---------------------------
---------------------------
---------------------------

local use = add_or_override_plugin -- require("doom.utils.user").add_or_override_plugin

-- Connors plugins
use{ 'rafcamlet/nvim-luapad' }
use{ 'nvim-treesitter/playground' }

---------------------------------
---       COLOR SCHEMES       ---
---------------------------------

use { 'xiyaowong/nvim-transparent', config = require("molleweide.configs.transparent") }
use { 'bluz71/vim-moonfly-colors' }
use { 'bluz71/vim-nightfly-guicolors' }
use { 'projekt0n/github-nvim-theme' }
use { 'Pocco81/Catppuccino.nvim' }
use { 'sainnhe/sonokai' }
use { 'folke/tokyonight.nvim', config = require("molleweide.configs.tokyonight") }

doom.colorscheme = 'tokyonight'

------------------------------
---       NAVIGATION       ---
------------------------------

---------------------------------
---       PLUGINS | LUA       ---
---------------------------------

use { "milisims/nvim-luaref" } -- move this to dev module.

---------------------------
---       EDITING       ---
---------------------------

use { 'jamessan/vim-gnupg' }
use { 'nanotee/nvim-lua-guide' }         -- additional help under :h nvim-lua-guid
use { 'romainl/vim-cool' }               -- disable highlights automatically on cursor move
use { 'tpope/vim-surround' }             -- cs`' to change `` to '', etc
use { 'tpope/vim-repeat'}
use { 'itspriddle/vim-stripper' }        -- strip whitespace on save
use { 'drzel/vim-line-no-indicator' }   -- nice scroll indicator
use { 'stevearc/aerial.nvim' }
use { 'mbbill/undotree' }                -- visualize undo tree
use { "kevinhwang91/nvim-bqf" }
use { 'ggandor/lightspeed.nvim', config = require("molleweide.configs.lightspeed"), }
use { 'beauwilliams/focus.nvim', config = function() require('focus').setup() end }
use { "s1n7ax/nvim-search-and-replace" }
use { 'airblade/vim-rooter' }
-- { 'oberblastmeister/nvim-rooter' },
-- { 'ldelossa/litee.nvim', config = require('molleweide.plugins.litee') },
-- { 'ldelossa/litee-calltree.nvim' },
-- { 'ldelossa/litee-symboltree.nvim' },
-- { 'ldelossa/litee-filetree.nvim' },
-- { 'ldelossa/litee-bookmarks.nvim' },
-- { 'nvim-pack/nvim-spectre', config = require('molleweide.plugins.nvim-spectre') },
-- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end },
-- https://github.com/sindrets/winshift.nvim
-- { 'romgrk/nvim-treesitter-context', config = function() require('molleweide.plugins.nvim-treesitter-context').setup({}) end }, -- BUG: nvim-treesitter-context gives error on startup
-- { 'https://github.com/justinmk/vim-dirvish' },
-- git@github.com:steelsojka/pears.nvim.git

-- https://github.com/mg979/vim-visual-multi -- TODO: try this one.
--		convert this one to lua


------------------------
---       MISC       ---
------------------------

use { 'christoomey/vim-tmux-navigator' }
use { 'melonmanchan/vim-tmux-resizer' }
use { 'benmills/vimux' }
use { 'godlygeek/tabular' }
use { 'vim-scripts/excel.vim' }
use { 'kjnh10/ExcelLikeVim' }
use { 'davidgranstrom/scnvim', run = ":call scnvim#install()", config = require("molleweide.configs.scnvim") }
use { 'ThePrimeagen/vim-be-good' }
-- use { 'rajasegar/vim-search-web' } -- fast looku
use { 'KabbAmine/vCoolor.vim' } -- open color picker / requires mouse to select color
use { 'jbyuki/venn.nvim', config = require("molleweide.configs.venn") }
use { "jbyuki/nabla.nvim" } -- , config = require("molleweide.configs.nabla")
use { "jbyuki/quickmath.nvim" } -- calculator
  -- { 'saifulapm/chartoggle.nvim' },
  -- { "AndrewRadev/switch.vim" },
  -- { "jszakmeister/vim-togglecursor" },
  -- { "Yohannfra/Vim-Flip.git" },
  -- { "elentok/togglr.vim.git" },

-----------------------
---       GIT       ---
-----------------------

use { 'TimUntersberger/neogit', gh }
use { 'tanvirtin/vgit.nvim', event = 'BufWinEnter', requires = { 'nvim-lua/plenary.nvim', }, config = require("molleweide.configs.vgit") }
use { "sindrets/diffview.nvim", config = require("molleweide.configs.diffview") }
use {
	'pwntester/octo.nvim',
	requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
	config = require("molleweide.configs.octo")
}
-- { 'f-person/git-blame.nvim' },
-- { 'ruifm/gitlinker.nvim' },
-- { 'rlch/github-notifications.nvim' },
-- { 'rmagatti/igs.nvim' },
-- { 'kyoh86/gitstat.nvim' },
-- { 'knsh14/githublink.nvim' },
-- { 'antonk52/gitignore-grabber.nvim' },
-- { 'petertriho/cmp-git' }, -- wip / unstable..


---------------------------------------------
---       OLD / DEPRECATED / UNUSED       ---
---------------------------------------------

-- { 'justinmk/vim-sneak' },             --       should be even faster than easymotion
-- { 'easymotion/vim-easymotion' },  --
--
--

----------------------------------------------
---       NEW PLUGINS / NOT USED YET       ---
----------------------------------------------

-- https://github.com/jbyuki/instant.nvim
-- https://github.com/TimUntersberger/neofs
-- https://github.com/SmiteshP/nvim-gps
-- https://github.com/danielpieper/telescope-tmuxinator.nvim
-- https://github.com/fedeizzo/nvim-printer
-- git@github.com:DanielWeidinger/nvim-sshfs.git
-- https://github.com/ThePrimeagen/refactoring.nvim -- <<<<<<<<<<<< https://martinfowler.com/books/refactoring.html
-- https://github.com/clojure-vim/clj-refactor.nvim

-------------------------------------
---       LOCAL / OVERRIDES       ---
-------------------------------------

--
-- -- add requires luasnip
-- plug({ "molleweide/LuaSnip-snippets.nvim", opt = true, after = "LuaSnip" })
-- -- -- table.insert(doom.packages["LuaSnip"].requires, { "molleweide/LuaSnip-snippets.nvim", opt = true })
-- doom.packages["LuaSnip"].config = function()
--   require("luasnip").config.set_config(doom.snippets)
--   require("luasnip").snippets = require("luasnip_snippets").load_snippets()
--   require("luasnip.loaders.from_vscode").load()
-- end

----------------------------------------
---       TELESCOPE EXTENSIONS       ---
----------------------------------------

use { 'cljoly/telescope-repo.nvim', gh }
use { 'nvim-telescope/telescope-packer.nvim', gh }

-- -- -- add ext to tele config
table.insert(doom.modules.telescope.settings.extensions, 'repo')
table.insert(doom.modules.telescope.settings.extensions, 'packer')

-- table.insert(telescope.ext) ??

-- TODO: neorg
-- git@github.com:nvim-neorg/neorg-telescope.git

-- requires https://github.com/cli/cli#installation
-- { "nvim-telescope/telescope-github.nvim", config = function() local telescope = require("telescope") telescope.load_extension("gh") end },

-- { "nvim-telescope/telescope-z.nvim", config = function() local telescope = require("telescope") telescope.load_extension("z") end }, -- navigate with z compatibles
-- { "nvim-telescope/telescope-ghq.nvim"}, -- remote repo managment for `https://github.com/x-motemen/ghq`
-- { 'cljoly/telescope-repo.nvim' } ) -- local git repos NOTE: I am using local version!!!

-- {
--   'nvim-telescope/telescope-project.nvim',
--   config = function()
--     local telescope = require("telescope")
--     telescope.load_extension("project")
--     vim.api.nvim_set_keymap(
--       'n',
--       '<leader>TT',
--       ":lua require'telescope'.extensions.project.project{}<CR>",
--       {noremap = true, silent = true}
--     )
--   end
-- }, -- navigate projects / similar to repo above

-- :Telescope cheat fd
-- :Telescope cheat recache " cheat will be auto cached with new updates on sources
-- {
--   "nvim-telescope/telescope-cheat.nvim",
--   requires = "tami5/sqlite.lua",
--   rocks = { "sqlite", "luv" },
--   config = function() local telescope = require("telescope") telescope.load_extension("cheat") end
-- }, -- search shell stuff

-- { "TC72/telescope-tele-tabby.nvim" }, -- manage tabs
-- { "dhruvmanila/telescope-bookmarks.nvim" }, -- web bookmarks
-- { "nvim-telescope/telescope-bibtex.nvim" }, -- tex references
-- { "nvim-telescope/telescope-node-modules.nvim" },
-- { "xiyaowong/telescope-emoji.nvim" },
-- { "crispgm/telescope-heading.nvim" },
-- { "benfowler/telescope-luasnip.nvim", config = function() local telescope = require("telescope") telescope.load_extension("luasnip") end  },
-- { "nvim-telescope/telescope-frecency.nvim" }, -- kind of like telescop internal `z`
-- { "teleivo/telescope-test.nvim" },

-- {
--   "rudism/telescope-dict.nvim",
--   config = function() local telescope = require("telescope") telescope.load_extension("dict")
--     vim.api.nvim_set_keymap(
--       'n',
--       '<leader>TD',
--       ":lua require('telescope').extensions.dict.synonyms()<CR>",
--       {noremap = true, silent = true}
--     )
--   end
-- }, -- how to install dicts??

-- { "nvim-telescope/telescope-media-files.nvim " }, -- onlylinux for now. theyre looking into hologram.nvim
-- { "jvgrootveld/telescope-zoxide" },
-- { "rmagatti/session-lens" }, -- require rmagatti auto-sessions looks very cool
-- {
--     "nvim-telescope/telescope-arecibo.nvim",
--     rocks = { "openssl", "lua-http-parser" },
-- }, -- search web

-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/LinArcX/telescope-command-palette.nvim
-- https://github.com/renerocksai/telekasten.nvim
-- https://github.com/davidgranstrom/telescope-scdoc.nvim
-- https://github.com/Josiah-tan/quick-projects-nvim
-- https://github.com/keyvchan/telescope-find-pickers.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/fcying/telescope-ctags-outline.nvim
-- https://github.com/nvim-neorg/neorg-telescope
-- https://github.com/IllustratedMan-code/telescope-conda.nvim
-- https://github.com/AckslD/nvim-neoclip.lua
-- https://github.com/EthanJWright/vs-tasks.nvim
-- https://github.com/luissimas/telescope-nodescripts.nvim
-- https://github.com/psiska/telescope-hoogle.nvim -- requires local install of hoogle
-- https://github.com/tigorlazuardi/telescope-cd.nvim
-- https://github.com/tamago324/telescope-openbrowser.nvim -- https://github.com/tyru/open-browser.vim
-- https://github.com/ok97465/telescope-py-importer.nvim
-- https://github.com/camgraff/telescope-tmux.nvim
-- https://github.com/ok97465/telescope-py-outline.nvim
-- https://github.com/crispgm/telescope-heading.nvim

------------------------------
---       ASYNC JOBS       ---
------------------------------

-- Example: repeating timer
--     1. Save this code to a file.
--     2. Execute it with ":luafile %". >


-- -- Create a timer handle (implementation detail: uv_timer_t).
-- local timer = vim.loop.new_timer()
-- local i = 0
-- -- Waits 1000ms, then repeats every 750ms until timer:close().
-- timer:start(1000, 750, function()
--   print('timer invoked! i='..tostring(i))
--   if i > 4 then
--     timer:close()  -- Always close handles to avoid leaks.
--   end
--   i = i + 1
-- end)
-- print('sleeping');

-- Example: File-change detection                          *watch-file*
--     1. Save this code to a file.
--     2. Execute it with ":luafile %".
--     3. Use ":Watch %" to watch any file.
--     4. Try editing the file from another text editor.
--     5. Observe that the file reloads in Nvim (because on_change() calls
--        |:checktime|). >

-- local w = vim.loop.new_fs_event()
-- local function on_change(err, fname, status)
--   -- Do work...
--   vim.api.nvim_command('checktime')
--   -- Debounce: stop/start.
--   w:stop()
--   watch_file(fname)
-- end
-- function watch_file(fname)
--   local fullpath = vim.api.nvim_call_function(
--     'fnamemodify', {fname, ':p'})
--   w:start(fullpath, {}, vim.schedule_wrap(function(...)
--     on_change(...) end))
-- end
-- vim.api.nvim_command(
--   "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

-- Example: TCP echo-server                                *tcp-server*
--     1. Save this code to a file.
--     2. Execute it with ":luafile %".
--     3. Note the port number.
--     4. Connect from any TCP client (e.g. "nc 0.0.0.0 36795"): >

-- With a server setup like this it should be possible to use reaper as a server
-- and then recieve playhead message and which would make vim into an editor,
-- given that I understand how I can parse reaper projects into nvim.
--
-- plugin -> `rpp-daw-client.nvim`
--
-- which listens for events coming from reaper. this would mean that I now
-- can compare which client is better. reapers or the original. at least,
-- this is a fun project just for learning how to interface with programs.
--
-- 1. read basic project data into buffer.
-- 2. update playhead color column every message.
--
-- if buffer = reaper_project >> use custom mappings/which-tree for rpp production.

-- local function create_server(host, port, on_connect)
--   local server = vim.loop.new_tcp()
--   server:bind(host, port)
--   server:listen(128, function(err)
--     assert(not err, err)  -- Check for errors.
--     local sock = vim.loop.new_tcp()
--     server:accept(sock)  -- Accept client connection.
--     on_connect(sock)  -- Start reading messages.
--   end)
--   return server
-- end
-- local server = create_server('0.0.0.0', 0, function(sock)
--   sock:read_start(function(err, chunk)
--     assert(not err, err)  -- Check for errors.
--     if chunk then
--       sock:write(chunk)  -- Echo received messages to the channel.
--     else  -- EOF (stream closed).
--       sock:close()  -- Always close handles to avoid leaks.
--     end
--   end)
-- end)
-- print('TCP echo-server listening on port: '..server:getsockname().port)


-------------------------------------
---       CMP NVIM OVERRIDE       ---
-------------------------------------

-- lsp.configure_functions["nvim-cmp"] = function()
--   local cmp = require("cmp")
--   local luasnip = require("luasnip")
--   local replace_termcodes = require("doom.utils").replace_termcodes
--
--   local source_map = {
--     nvim_lsp = "[LSP]",
--     luasnip = "[Snp]",
--     buffer = "[Buf]",
--     nvim_lua = "[Lua]",
--     path = "[Path]",
--   }
--
--   --- Helper function to check what <Tab> behaviour to use
--   --- @return boolean
--   local function check_backspace()
--     local col = vim.fn.col(".") - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
--   end
--
--   -- Initalize the cmp toggle if it doesn't exist.
--   if _doom.cmp_enable == nil then
--     _doom.cmp_enable = true
--   end
--
--   cmp.setup(vim.tbl_deep_extend("force", doom.modules.lsp.settings.completion, {
--     completeopt = nil,
--     completion = {
--       completeopt = doom.modules.lsp.settings.completion.completeopt,
--     },
--     formatting = {
--       format = function(entry, item)
--         item.kind = string.format("%s %s", doom.modules.lsp.settings.completion.kinds[item.kind], item.kind)
--         item.menu = source_map[entry.source.name]
--         item.dup = vim.tbl_contains({ "path", "buffer" }, entry.source.name)
--         return item
--       end,
--     },
--     mapping = {
--       ["<C-p>"] = cmp.mapping.select_prev_item(),
--       ["<C-n>"] = cmp.mapping.select_next_item(),
--       ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-Space>"] = cmp.mapping.complete(),
--       ["<C-e>"] = cmp.mapping.close(),
--       -- ["<ESC>"] = cmp.mapping.close(),
--       ["<C-j>"] = cmp.mapping.confirm({
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true,
--       }),
--       ["<C-l>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--         elseif luasnip.expand_or_jumpable() then
--           vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
--         elseif check_backspace() then
--           vim.fn.feedkeys(replace_termcodes("<Tab>"), "n")
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--       ["<C-k>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-jump-prev"), "")
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
--   }, {
--     mapping = type(doom.modules.lsp.settings.completion.mapping) == "function" and doom.modules.lsp.settings.completion.mapping(cmp)
--       or doom.modules.lsp.settings.completion.mapping,
--     enabled = function()
--       return _doom.cmp_enable and vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
--     end,
--   }))
-- end


-- vim: sw=2 sts=2 ts=2 expandtab
