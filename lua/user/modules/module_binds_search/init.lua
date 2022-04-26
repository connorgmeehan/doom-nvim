local module_binds_search = {}

-- TODO:
--
--    - use TS to capture binds in modules and make it possible
--    to filter binds ui so that you can find which module that sets which binds.

-- module_binds_search.settings = {}

-- module_binds_search.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- module_binds_search.cmds = {}
-- module_binds_search.autocmds = {}
-- module_binds_search.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(module_binds_search.binds, {
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

return module_binds_search

