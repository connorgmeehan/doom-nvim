local create_binds = {}

-- TODO:
--
--    - cmd: DoomBindsLeaderAddLevel
--    - cmd: DoomBindsLeaderAddBindToLevelUnderCursor
--    - cmd: DoomBindsAddRegularBind
--    		telescope picker -> select module -> enter module.binds table and insert a regular bind

-- create_binds.settings = {}

-- create_binds.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- create_binds.cmds = {}
-- create_binds.autocmds = {}
-- create_binds.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(create_binds.binds, {
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

return create_binds

