local doom_queries = {}

-- TODO:
--
--    - make commands for building queries
--
--    select/make_new/remove queries UI
--
--    @param: lang
--    @param: name
--
--    reuse the same picker from `create_module`
--
-- 	picker -> fuzzy select name

-- 	if rm -> kill()
-- 	if new -> picker -> select lang

----------------------------
-- SETTINGS
----------------------------

-- doom_queries.settings = {}

----------------------------
-- PACKAGES
----------------------------

-- doom_queries.packages = {
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

doom_queries.cmds = {
  {
    "DoomQueriesUI",
    function()
      print("doom queries ui")
    end,
  },
}

--------------------------
-- AUTOCMDS
--------------------------

-- doom_queries.autocmds = {}

----------------------------
-- BINDS
----------------------------

doom_queries.binds = {}

----------------------------
-- LEADER BINDS
----------------------------

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(doom_queries.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",

        {
              { "q", [[ :DoomQueriesUI<cr> ]], name = "make/open/rm doom ts queries" },
        },
      },
    },
  })
end

----------------------------
-- RETURN
----------------------------

return doom_queries
