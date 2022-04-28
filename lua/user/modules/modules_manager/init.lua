local modules_manager = {}

-- TODO:
--
--    - in the end >> refactor all module management stuff into this module and then
--    move it into the doom core.

----------------------------
-- SETTINGS
----------------------------

-- modules_manager.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- modules_manager.packages = {
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

-- modules_manager.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- modules_manager.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- modules_manager.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(modules_manager.binds, {
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

return modules_manager


