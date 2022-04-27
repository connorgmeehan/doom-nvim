local doom_global_settings_ui_walkthrough = {}

-- TODO:
--
--    - make a fun UI that walks through all of the options in the doom table
--    	and presents user with a UI for udating a value, on select -> go to
--    	next value, use <C-q> to exit the UI.
--    	Use treesitter to update all of the values in the code.

----------------------------
-- SETTINGS
----------------------------

doom_global_settings_ui_walkthrough.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- doom_global_settings_ui_walkthrough.packages = {
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

doom_global_settings_ui_walkthrough.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- doom_global_settings_ui_walkthrough.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- doom_global_settings_ui_walkthrough.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(doom_global_settings_ui_walkthrough.binds, {
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

return doom_global_settings_ui_walkthrough


