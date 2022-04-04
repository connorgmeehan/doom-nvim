local luadev = {}

-- https://github.com/rockerBOO/awesome-neovim#neovim-lua-development
--
-- tjdevries/nlua.nvim - Lua Development for Neovim.
-- svermeulen/vimpeccable - Commands to help write your .vimrc in Lua or any Lua based language.
-- rafcamlet/nvim-luapad - Interactive real time Neovim scratchpad for embedded Lua engine - Type and watch!.
-- nvim-lua/plenary.nvim - Plenary: full; complete; entire; absolute; unqualified. All the Lua functions I don't want to write twice.
-- nvim-lua/popup.nvim - An implementation of the Popup API from vim in Neovim.
-- tjdevries/vlog.nvim - Single file, no dependency, easy copy & paste log file to add to your Neovim Lua plugins.
-- bfredl/nvim-luadev - REPL/debug console for Neovim Lua plugins. The :Luadev command will open an scratch window which will show output from executing Lua code.
-- jbyuki/one-small-step-for-vimkind - An adapter for the Neovim Lua language. It allows you to debug any Lua code running in a Neovim instance (A Lua plugin that can debug Neovim Lua plugins).
-- tami5/sqlite.lua - SQLite/LuaJIT binding for Lua and Neovim.
-- folke/lua-dev.nvim - Dev setup for init.Lua and plugin development with full signature help, docs and completion for the Neovim Lua API.
-- m00qek/plugin-template.nvim - A plugin template that setups test infrastructure and GitHub Actions.
-- mini.doc - Module of echasnovski/mini.nvim for generation of help files from EmmyLua-like annotations. Allows flexible customization of output via hook functions.
-- nanotee/luv-vimdocs - The luv docs in vimdoc format.
-- ellisonleao/nvim-plugin-template - Another neovim plugin template, using GitHub's template feature.

luadev.settings = {}

luadev.packages = {
  ["nvim-luapad"] = { "rafcamlet/nvim-luapad" },
  ["playground"] = { "nvim-treesitter/playground" },
}

return luadev
