local module_bind_for_every_line = {}

-- TODO:
--
--    - create a row based full view UI where we list all binds AND allow user to sort binds based
--    on properties/ filter binds/ etc.
--    - mapping -> go to module position where the bind is created.
--
--    this module could be generalized into a UI
--    that represents anything on a row by row basis
--    eg. binds, cmds, autocmds, and packages,
--    so that you can instantly navigate to any module
--    that hosts the property under the cursor.
--    also you can use this in telescope also.

----------------------------
-- SETTINGS
----------------------------

-- module_bind_for_every_line.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- module_bind_for_every_line.packages = {
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

-- module_bind_for_every_line.cmds = {}

--------------------------
-- AUTOCMDS
--------------------------

-- module_bind_for_every_line.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- module_bind_for_every_line.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(module_bind_for_every_line.binds, {
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

return module_bind_for_every_line


