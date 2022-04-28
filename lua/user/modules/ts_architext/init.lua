local ts_architext_ui = {}

-- TODO:
--
--    -  play around with the plugin and learn how it works, then make a cool ui
--    	for it that makes it look cool when you make queries.
--
--    	floating popup ui where I can use keys to jump around between these ui windows.
--    	also add mappings for moving the ui around. or repositioning the floats.
--
--    	this is stupid but it is also fun and good practice to play around with UI placement etc.

----------------------------
-- SETTINGS
----------------------------

ts_architext_ui.settings = {}

----------------------------
-- PACKAGES
----------------------------

--[[
--  type: string, text: "vigoux/architext.nvim", [24 20, 24 43]
-- :!ghm clone git@github.com:vigoux/architext.nvim.git
-- :!ghm clone git@github.com:vigoux/architext.nvim.git
-- [No write since last change]
-- ^[[0;32m     clone^[[0m ssh://git@github.com/vigoux/architext.nvim.git -> /Users/hjalmarjakobsson/code/repos/github.com/vigoux/architext.nvim
-- ^[[0;37m       git^[[0m clone --recursive ssh://git@github.com/vigoux/architext.nvim.git /Users/hjalmarjakobsson/code/repos/github.com/vigoux/architext
-- .nvim
-- Cloning into '/Users/hjalmarjakobsson/code/repos/github.com/vigoux/architext.nvim'...
-- git@github.com: Permission denied (publickey).
-- fatal: Could not read from remote repository.
--
-- Please make sure you have the correct access rights
-- and the repository exists.
-- ^[[0;31m     error^[[0m failed to get "git@github.com:vigoux/architext.nvim.git": /usr/local/bin/git: exit status 128
-- --]]

ts_architext_ui.packages = {
  ["architext"] = { "vigoux/architext.nvim" }, -- NOTE: substitute s// w/ TS QUERIES
-- [""] = {},
-- [""] = {},
-- [""] = {},
}

----------------------------
-- CONFIGS
----------------------------

----------------------------
-- CMDS
----------------------------

-- ts_architext_ui.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- ts_architext_ui.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- ts_architext_ui.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(ts_architext_ui.binds, {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "YYY",
--         name = "+ZZZ",
--         {
--         -- first level
--         },
--       },
--     },
--   })
-- end

----------------------------
-- RETURN
----------------------------

return ts_architext_ui


