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

----------------------------
-- LOGIC
----------------------------

local function run_doom_queries_ui()
  print("doom queries ui!!!")

  -- get all queries together with they file paths
  -- fuzzy or line
  -- run callback
  --

  -- 	picker -> fuzzy/line select name
  -- 	if open -> open()
  -- 	if rm -> kill()
  -- 	if new -> picker -> select lang -> make new under correct lang dir.
end

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
      run_doom_queries_ui()
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
