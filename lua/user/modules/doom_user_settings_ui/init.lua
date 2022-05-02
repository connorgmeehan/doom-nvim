local doom_user_settings_ui = {}

--  add override to `config.lua` file
--
--
--
--
--  TODO:
--
--  	1. get all string fields
--  	2. tele entry: map each field back to `settings.field..fieldN`
--  	3. on select
--  	4. callback NUI input
--  	5. on submit -> turn back to telescope continue
--  	...
--  	...
--  	w. on telescope exit
--  	x. replace each modified node in source.
--  	y. write file back to `./settings.lua`
--  	z. full_reload()

----------------------------
-- SETTINGS
----------------------------

-- doom_user_settings_ui.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- doom_user_settings_ui.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

----------------------------
-- CONFIGS
----------------------------

----------------------------
-- CMDS
----------------------------

-- doom_user_settings_ui.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- doom_user_settings_ui.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- doom_user_settings_ui.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(doom_user_settings_ui.binds, {
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

return doom_user_settings_ui


