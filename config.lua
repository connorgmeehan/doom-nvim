-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).
--

local use = require("doom.utils.user").add_or_override_plugin

-- Editor config
doom.indent = 2
doom.escape_sequences = {}
-- vim.lsp.set_log_level('trace')
vim.diagnostic.config({
  float = {
    source = 'always',
  },
})

-- Colourscheme
use { 'sainnhe/sonokai' }
doom.colorscheme = 'sonokai'

-- Extra packages
use { 'rafcamlet/nvim-luapad' }
use { 'nvim-treesitter/playground' }
use { 'tpope/vim-surround' }


-- vim: sw=2 sts=2 ts=2 expandtab
