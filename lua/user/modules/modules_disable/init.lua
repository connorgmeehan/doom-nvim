local modules_disable = {}

-- TODO:
--
--
-- 	1. Three cmds:
-- 		`DoomModulesDisableAll`
-- 		`DoomModulesDisableToggleFuzzySelect`
--
-- 		in the ui, show disabled entries with the `-- ` prefix so that user can
-- 		see which is enabled/disabled -> toggle fuzzy match on <CR>
--
-- 	2. first do disable all..
-- 		a. get root modules captures.
-- 		b. get captures `module-enabled`
-- 		c. for each -> prepend with `-- `
--

local function disable_all_modules()
	print("!!!")
end
local function disable_all_select() end

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
modules_disable.cmds = {
  {
    "DoomModulesDisableAll",
    function()
      disable_all_modules()
    end,
  },
{
    "DoomModulesDisableSelect",
    function()
      disable_all_select()
    end,
  }
}

--------------------------
-- AUTOCMDS
--------------------------

-- modules_disable.autocmds = {}

----------------------------
-- BINDS
----------------------------

modules_disable.binds = {
  {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+doom",
        {
          {
            "M",
            name = "+modules",
            {
              { "P", ":DoomModulesDisableAll<cr>", name = "disable all modules" },
              { "p", ":DoomModulesDisableSelect<cr>", name = "disable select" },
            },
          },
        },
      },
    },
    -- lvl 1 branch
  },
}

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
