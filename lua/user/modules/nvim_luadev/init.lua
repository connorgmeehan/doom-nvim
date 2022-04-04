local luadev = {}

luadev.settings = {}

luadev.packages = {
  -- folke/lua-dev.nvim -- already in core!!
  -- ["nlua.nvim"] = { "tjdevries/nlua.nvim" },
  -- ["vlog.nvim"] = {"tjdevries/vlog.nvim"}, -- Single file, no dependency, easy copy & paste log file to add to your Neovim Lua plugins.
  -- ["vimpeccable"] = { "svermeulen/vimpeccable" },
  -- ["nvim-luadev"] = { "bfredl/nvim-luadev" }, -- REPL/debug console for Neovim Lua plugins. The :Luadev command will open an scratch window which will show output from executing Lua code.
  -- ["nvim-plugin-template"] = {"ellisonleao/nvim-plugin-template"}, -- Another neovim plugin template, using GitHub's template feature.
  ["nvim-luapad"] = { "rafcamlet/nvim-luapad" }, -- Interactive real time Neovim scratchpad for embedded Lua engine - Type and watch!.
  ["playground"] = { "nvim-treesitter/playground" },
  -- jbyuki/one-small-step-for-vimkind -- An adapter for the Neovim Lua language. It allows you to debug any Lua code running in a Neovim instance (A Lua plugin that can debug Neovim Lua plugins).
  -- tami5/sqlite.lua -- SQLite/LuaJIT binding for Lua and Neovim.
  -- mini.doc -- Module of echasnovski/mini.nvim for generation of help files from EmmyLua-like annotations. Allows flexible customization of output via hook functions.
  -- m00qek/plugin-template.nvim -- A plugin template that setups test infrastructure and GitHub Actions.
}

return luadev
