local create_module_sync_root = {}

-- TODO:
--
--    - use tree-sitter to query the modules file and check that each user/modules scandir exist
--     		in the modules.ila file
--     		and here it is important to make sure that we include comments so that we can
--     		easilly manage cases where a module is commented out.

-- create_module_sync_root.settings = {}

-- create_module_sync_root.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- create_module_sync_root.cmds = {}
-- create_module_sync_root.autocmds = {}
-- create_module_sync_root.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(create_module_sync_root.binds, {
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

return create_module_sync_root
