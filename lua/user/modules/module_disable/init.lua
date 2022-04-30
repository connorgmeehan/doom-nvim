local utils = require("doom.utils")
local fs = require("doom.utils.fs")
local tsq = require("vim.treesitter.query")
local ts_utils = require("nvim-treesitter.ts_utils")
local locals = require("nvim-treesitter.locals")
local api = vim.api
local cmd = api.nvim_command
local doom_queries = require("user.utils.doom_queries")
local user_ts_utils = require("user.utils.ts")

local modules_disable = {}

-- TODO:
--
-- 		in the ui, show disabled entries with the `-- ` prefix so that user can
-- 		see which is enabled/disabled -> toggle fuzzy match on <CR>

-- -- todo: later, use this for transforming text with architext instead.
-- local function path_transform_with_architext(edits, path)
--   -- after architext has written to the buffer --> write buf back to file.
--   -- TODO: 3. func write_buf_to_file()
--   local text_to_write = vim.api.nvim_buf_get_lines(b, 0, "S")
--   vim.fn.writefile(text_to_write, path)
-- end

local function filter_modules_by_cat(source, nodes, cat)
  local res = {}
  for _, n in pairs(nodes) do
    local p = n:parent()
    local pp = p:parent()
    local pps = p:prev_named_sibling()
    local mcat = pps:prev_named_sibling() -- this gets the parent category name
    local nt = tsq.get_node_text(pps, source)
print(nt)
    if nt == cat then
      table.insert(res, n)
    end
  end
  return res
end

-- local function disable_all_modules

local function load_with_file(path)
  -- local buf_prefix = "architext_replace_path_tmp_buf"
  local buf_tmp = vim.api.nvim_create_buf(true, true)
  local fd = fs.read_file(path)
  -- vim.api.nvim_buf_set_name(buf_tmp, buf_prefix .. ":" .. path)
  vim.api.nvim_buf_set_text(buf_tmp, 0, 0, 0, 0, vim.split(fd, "\n"))
  return buf_tmp
end

-- FIX: the query is not perfect. I cannot get the capture to get only nodes under a section. That is why I do the filtering below.
local function modules_toggle_section(opts)
  local toggle_state = opts.enabled and "enabled" or "disabled"
  local settings_path = utils.find_config("modules.lua") -- returns full path..

  local buf = load_with_file(settings_path)
  local buf, root, qp = user_ts_utils.run_query_on_buf("lua", "doom_root_modules", buf)
  local captured_nodes = user_ts_utils.get_captures(root, buf, qp, "modules." .. toggle_state)
  local nodes_by_section = filter_modules_by_cat(buf, captured_nodes, opts.section_name)

  print(#nodes_by_section)
  -- print(vim.inspect(nodes_by_section))
  for i, v in ipairs(nodes_by_section) do
    print(tsq.get_node_text(v, buf))
  end

  if opts.enabled then
    user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "-- ")
  else
    -- remove comment
    user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "XXX ")
    -- print("root modules rm comment > todo..")
  end

  local lc = vim.api.nvim_buf_line_count(buf)

  -- for i, l in ipairs(t) do
  --   print(l)
  -- end

  -- NOTE: E. write buffer and delete.
  --     write `buf` back to `path`
  -- vim.api.nvim_buf_delete(buf, { force = true, unload = true })
	-- vim.api.nvim_win_set_buf(0, buf)
end

local function disable_all_user_modules()
  modules_toggle_section({ section_name = "user", enabled = false })
end

local function disable_select() end

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
      disable_all_user_modules()
    end,
  },
  {
    "DoomModulesDisableSelect",
    function()
      disable_all_select()
    end,
  },
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
