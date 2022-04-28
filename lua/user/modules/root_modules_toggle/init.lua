local root_modules_toggle = {}

-- TODO:
--
--    - use the doom root modules query to manage enabled/disabled
--    modules.
--
--     >> rename to `modules_manager`

----------------------------
-- SETTINGS
----------------------------

-- root_modules_toggle.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- root_modules_toggle.packages = {
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

root_modules_toggle.cmds = {
  {
    "DoomModulesDisableAllUser",
    function()
      print("hello")
    end,
  },
}

--------------------------
-- AUTOCMDS
--------------------------

-- root_modules_toggle.autocmds = {}

----------------------------
-- BINDS
----------------------------

-- root_modules_toggle.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(root_modules_toggle.binds, {
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

return root_modules_toggle
