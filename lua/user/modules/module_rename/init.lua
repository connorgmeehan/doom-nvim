local fs = require("doom.utils.fs")
local user_utils_ui = require("user.utils.ui")
local user_utils_path = require("user.utils.path")
local user_utils_modules = require("user.utils.modules")

local module_rename = {}

-- TODO:
--
--
--    3. update
--    	a. `modules.lua`
--    	  	+  get user modules
--    	  	+ get prev name match
--    	  	+ replace with new name
--
-- 		b. check name aleady exists? > open nui window again?
--
--    	c. update module dirname
local function promt_for_new_name() end

--
-- ACTION FUNCTIONS -> params: (buf, config, module, telescope_input)
--

local function m_rename(b, c, m, i)
  print("M RENAME: ", i)
  -- 1. transform `modules.lua` with architext
  -- 2. change module dir name.
end
local function m_create(b, c, m, i)
  print("M CREATE: ", i)
  -- local path_user_modules = string.format("%s/lua/user/modules", system.doom_root)
  -- local new_module_path = string.format("%s%s%s", path_user_modules, system.sep, new_mname)
  -- local new_module_init_file = string.format("%s%sinit.lua", new_module_path, system.sep)
  -- vim.cmd(string.format("!mkdir -p %s", new_module_path))
  -- vim.cmd(string.format("!touch %s", new_module_init_file))
  -- fs.write_file(
  --   new_module_init_file,
  --   user_utils_modules.get_module_template_from_name(new_mname),
  --   "w+"
  -- )
  -- vim.cmd(string.format(":e %s", new_module_init_file))
  -- -- local newbuf = vim.api.nvim_create_buf(1, 0)
  -- -- vim.api.nvim_buf_set_lines(newbuf, 0, 1, false, vim.fn.split(module_template_string, "\n"))
  -- -- set file to cur bef
  -- -- vim.cmd(string.format(":%sb", newbuf))
end
local function m_edit(buf, config, m, i)
  print("M EDIT: ", i)
  -- vim.cmd(string.format(":e %s/lua/user/modules/%s/init.lua", system.doom_root, mname))
end
local function m_delete(buf, config)
  print("M DELETE: ", i)
  -- 1. nui menu -> are you sure
  -- 2. if yes ->
  -- 	a. transform `modules.lua`
  -- 	b. remove dir.
end
local function m_toggle(buf, config)
  print("M TOGGLE: ", i)
  -- if opts.enabled then
  --   user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "-- ")
  -- else
  --   -- remove comment
  --   user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "XXX ")
  --   -- print("root modules rm comment > todo..")
  -- end
end
local function m_move(buf, config)
  -- move module into into (features/langs)
end
local function m_merge(buf, config) end
-- action_id = "BIND"
-- action_id = "LEADER"
-- action_id = "CMD"
-- action_id = "AUTOCMD"
-- action_id = "PACKAGE"

--
-- ACTION ROUTER
--

local function picker_get_state(prompt_bufnr)
  local state = require("telescope.actions.state")
  local line = state.get_current_line(prompt_bufnr)
  local fuzzy = state.get_selected_entry(prompt_bufnr)
  return fuzzy, line
end

local function picker_action_router(buf, config, action, use_line)
  local fuzzy, line = picker_get_state(buf)
  local m_sel = config.entries_mapped[fuzzy.value]
  if action == "CREATE" then
    m_create(buf, config, m_sel, line)
  elseif action == "RENAME" then
    m_rename(buf, config, m_sel, fuzzy.value)
  elseif action == "EDIT" then
    m_edit(buf, config, m_sel, fuzzy.value)
  elseif action == "DELETE" then
  elseif action == "TOGGLE" then
    -- elseif action == "MOVE" then
    -- elseif action == "MERGE" then
    -- elseif action == "BINDS" then
  end
  require("telescope.actions").close(buf)
end

--
-- DOOM MODULES PICKER
--

local function picker_rename(config)
  local opts = opts or require("telescope.themes").get_cursor()
  require("telescope.pickers").new(opts, {
    prompt_title = "Doom Modules Manager",
    finder = require("telescope.finders").new_table({
      results = config.entries,
    }),
    sorter = require("telescope.config").values.generic_sorter(opts),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(bufnr)
        picker_action_router(bufnr, config, "EDIT", false)
      end)
      map("i", "<C-r>", function(bufnr)
        picker_action_router(bufnr, config, "RENAME", false)
      end)
      map("i", "<C-e>", function(bufnr)
        picker_action_router(bufnr, config, "CREATE", true) -- use line...
      end)
      map("i", "<C-u>", function(bufnr)
        picker_action_router(bufnr, config, "DELETE", false)
      end)
      map("i", "<C-t>", function(bufnr)
        picker_action_router(bufnr, config, "TOGGLE", false)
      end)
      return true
    end,
  }):find()
end

local function prepare_data_for_picker()
  local modules_data = user_utils_path.get_module_meta_data()
  local picker_config = {
    entries = {}, -- what you see
    entries_mapped = {}, -- the mapped table data
  }
  for _, m in pairs(modules_data) do
    local ui_str = m.section .. " > " .. m.name
    table.insert(picker_config.entries, ui_str)
    picker_config.entries_mapped[ui_str] = m
  end
  picker_rename(picker_config)
end

-- module_rename.settings = {}

-- module_rename.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

module_rename.cmds = {
  {
    "DoomModulesRenameSelect",
    function()
      prepare_data_for_picker()
    end,
  },
}

-- module_rename.autocmds = {}
module_rename.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(module_rename.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+Doom",
        {
          {
            {
              "M",
              name = "+modules",
              { "r", [[ :DoomModulesRenameSelect<cr> ]], name = "rename" },
            },
          },
        },
      },
    },
  })
end

return module_rename
