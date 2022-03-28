local telescope = {}

-- use({ doom.moll.ghq_github .. "cljoly/telescope-repo.nvim" })
-- use({ doom.moll.ghq_github .. "nvim-telescope/telescope-packer.nvim" })
--
-- -- -- -- add ext to tele config
-- table.insert(doom.modules.telescope.settings.extensions, "repo")
-- table.insert(doom.modules.telescope.settings.extensions, "packer")









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


return telescope
