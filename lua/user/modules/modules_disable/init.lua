local modules_disable = {}

-- TODO:
--
--    - helper for debugging config by disabling
--    all modules in the `modules.lua` file
--
--
--    read through the source of a TS comment plugin and see if there
--    are any nice utils etc. that can be used in doom.

----------------------------
-- SETTINGS
----------------------------

modules_disable.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- modules_disable.packages = {
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

-- disable_all_modules("features/langs/user")
modules_disable.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- modules_disable.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- modules_disable.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(modules_disable.binds, {
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

return modules_disable


