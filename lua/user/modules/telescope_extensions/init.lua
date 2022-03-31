local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled
local user_util = require("user.utils")

after_telescope = user_util.after_telescope
load_extension_helper = user_util.load_extension_helper
up = user_util.paths

local extensions = {}

local code = "~/code/repos/"
local gh = code .. "github.com/"

extensions.settings = {}

extensions.packages = {
  ["telescope-repo.nvim"] = { up.ghq.github .. "cljoly/telescope-repo.nvim" },
  ["telescope-packer.nvim"] = { gh .. "nvim-telescope/telescope-packer.nvim" },
  ["neorg-telescope"] = { "nvim-neorg/neorg-telescope" },
  ["telescope-ghq.nvim"] = { "nvim-telescope/telescope-ghq.nvim" },
  ["telescope-github.nvim"] = { "nvim-telescope/telescope-github.nvim" }, -- requires https://github.com/cli/cli#installation
  ["telescope-z.nvim"] = { "nvim-telescope/telescope-z.nvim" }, -- navigate with z compatibles
  ["telescope-tele-tabby.nvim"] = { "TC72/telescope-tele-tabby.nvim" }, -- manage tabs
}
for _, ext in ipairs(extensions.packages) do
  ext["after"] = after_telescope
end

extensions.configs = {}
extensions["telescope-repo.nvim"] = load_extension_helper("repo")
extensions["telescope-packer.nvim"] = load_extension_helper("packer")
extensions["neorg-telescope"] = load_extension_helper("neorg")
extensions["telescope-ghq.nvim"] = load_extension_helper("ghq")
extensions["telescope-github.nvim"] = load_extension_helper("github")

-- TODO: neorg

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

return extensions
