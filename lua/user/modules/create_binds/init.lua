local tsq = require("vim.treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command
local doom_queries = require("user.utils.doom_queries")
local user_ts_utils = require("user.utils.ts")

local create_binds = {}

-- TODO:
--
--    - cmd: DoomBindsLeaderAddLevel
--    - cmd: DoomBindsLeaderAddBindToLevelUnderCursor
--    - cmd: DoomBindsAddRegularBind
--    		telescope picker -> select module -> enter module.binds table and insert a regular bind
--
--    this is going to be very interesting to do a telescope picker for.
--
--    1. get all modules
--    2. make picker
--    3. enter new binds position in module.
--    4. enter leader position
--    5. use with snippets.
--
--
--    BINDS NAVIGATION
--
--    make commands for jumping between command tables quickly.
--
--    next/prev bind
--    next/prev leader bind
--    add child
--    jump next child.
--
--    insert leader branch

create_binds.settings = {}

-- create_binds.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

local function create_bind_for_select_module()
  print("create binds...")

  -- TODO: need to read query into string first
  local bufnr, root, parsed_query = user_ts_utils.get_query(
    user_ts_utils.get_query_file("lua", "doom_module_binds")
  )

  -- local package_string_nodes = user_ts_utils.get_captures(root, bufnr, parsed_query, "package_string")

  user_ts_utils.log_captures(root, bufnr, parsed_query)

  -- local picker_config = {
  --   bufnr = bufnr,
  --   entries = {},
  --   entries_mapped = {},
  --   callback = fork_package,
  -- }
  -- for k, v in pairs(package_string_nodes) do
  --   local nt = tsq.get_node_text(v, bufnr)
  --   table.insert(picker_config.entries, nt)
  --   picker_config.entries_mapped[nt] = v
  -- end
  -- fork_plugins_picker_cur_buf(picker_config)
end

create_binds.cmds = {
  {
    "DoomCreateBindForSelectModule",
    function()
      create_bind_for_select_module()
    end,
  },
}

-- create_binds.autocmds = {}

create_binds.binds = {
  { "gXX", "jj", name = "dummytest" },
  {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+doom",
        {
          {
            "B",
            [[ :DoomCreateBindForSelectModule<cr> ]],
            name = "create bind for mod",
            options = { silent = false },
          },
          { "X", "jj", name = "doom XX" },
        },
      },
    },
    {
      {
        "X",
        name = "+XXX",
        {},
      },
    },
  },
}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(create_binds.binds, {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "D",
--         name = "+doom",
--         {
--           { "B", [[ :DoomCreateBindForSelectModule<cr> ]], name = "create bind for mod" },
--         },
--       },
--     },
--   })
-- end

return create_binds
