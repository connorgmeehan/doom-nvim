local module_bind_for_every_line = {}

-- TODO:
--
--    - create a row based full view UI where we list all binds AND allow user to sort binds based
--    on properties/ filter binds/ etc.
--    - mapping -> go to module position where the bind is created.

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


