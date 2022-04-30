local modules_manager = {}

-- TODO:
--
--    - in the end >> refactor all module management stuff into this module and then
--    move it into the doom core.
--
--
--
--
--    1. make picker for all modules
--    2. select/create
--    3. make a binding for each module component
--    4. mappings
--    	<c-b> 	make bind
--    	<c-l> 	make leader bind
--    	<c-s> 	make cmd
--    	<c-a> 	make autocmd
--    	<c-i> 	make settings
--    	<c-u> 	add package
--
--    From this picker we would create good callbacks to handle each situation.
--    Merge all picker modules into this one.
--

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


