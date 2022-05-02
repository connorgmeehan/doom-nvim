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
--
--    later many of the `insertion` binds will be implemented as a snippet.

create_binds.settings = {}

-- create_binds.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }
--

-- merge into only next/prev bind
local function nav_next_bind() end
local function nav_prev_bind() end
local function nav_next_leader_bind() end
local function nav_prev_leader_bind() end
local function bind_insert_above() end
local function bind_insert_below() end

local function nav_next_branch() end
local function nav_prev_branch() end
local function branch_insert_above() end
local function branch_insert_below() end

local function bind_insert_regular()
  -- find position of last regular bind
  -- insert new bind table template after
  -- enter insert mode at char position.
end
local function bind_insert_leader()
  -- find position of first leader lvl1 table
  -- insert regular bind temblate after.
  -- insert char position
end

local function create_bind_for_select_module()
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
  { "gXX", "jj", name = "regular bind" },
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
        },
      },
    },
    {
      {
        "X",
        name = "+1st",
        {
          { "A", "jk", name = "meh" },
          { "B", "jjeek", name = "xih" },
          { "C", "jjeek", name = "aa bb" },
          {
            "Y",
            name = "+2nd",
            {
              { "E", "jk", name = "meh" },
              { "F", "jjeek", name = "xih" },
              { "Z", name = "+3rd", {} },
            },
          },
        },
      },
    }, -- lvl 1 branch
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
