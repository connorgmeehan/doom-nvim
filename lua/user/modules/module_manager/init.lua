local utils = require("doom.utils")
local fs = require("doom.utils.fs")
local system = require("doom.core.system")
local user_utils_ui = require("user.utils.ui")
local user_utils_path = require("user.utils.path")
local user_utils_modules = require("user.utils.modules")
local tsq = require("vim.treesitter.query")
local user_ts_utils = require("user.utils.ts")

local M = {}

M.settings = {
  confirm_alternatives = { "yes", "no" },
  section_alternatives = { "user", "features", "langs", "core" },
  popup = {
    relative = "cursor",
    position = {
      row = 1,
      col = 0,
    },
    size = 20,
    border = {
      style = "rounded",
      text = {
        top = "[Input]",
        top_align = "left",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal",
    },
  },
  menu = {
    position = "20%",
    size = {
      width = 20,
      height = 2,
    },
    relative = "editor",
    border = {
      style = "single",
      text = {
        top = "Choose Something",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal",
    },
  },
}

local function nui_input(title, callback)
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event
  local input = Input(M.settings.popup, {
    prompt = title .. "> ",
    default_value = "",
    on_close = function()
      print("Input closed!")
    end,
    on_submit = function(value)
      callback(value)
    end,
    on_change = function(value)
      print("Value changed: ", value)
    end,
  })
  input:mount()
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

local function menu_set_title(title)
  local opts = M.settings.menu
  opts.border.text.top = title
  return opts
end

local function nui_menu(title, alternatives, callback)
  local Menu = require("nui.menu")
  local event = require("nui.utils.autocmd").event

  local lines = {
    Menu.separator("Menu Group", {
      char = "-",
      text_align = "right",
    }),
  }

  for i, v in ipairs(alternatives) do
    table.insert(lines, Menu.item(v))
  end

  local menu = Menu(menu_set_title(title), {
    lines = lines,
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_close = function()
      print("CLOSED")
    end,
    on_submit = function(item)
      callback(item)
    end,
  })

  -- mount the component
  menu:mount()

  -- close menu when cursor leaves buffer
  menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

--
-- CHECKS
--

local function check_if_module_name_exists(c, m, new_name)
  local already_exists = false
  for _, v in pairs(c.entries_mapped) do
    if v.section == m.section and v.name == new_name then
      already_exists = true
    end
  end
  return already_exists
end

local function validate_all_modules_listed_in_root()
  -- get modules data.
  -- get root query
  -- fore each > exists in root?
end

--- I/O
local function load_with_file(path)
  -- local buf_prefix = "architext_replace_path_tmp_buf"
  local buf_tmp = vim.api.nvim_create_buf(true, true)
  local fd = fs.read_file(path)
  -- vim.api.nvim_buf_set_name(buf_tmp, buf_prefix .. ":" .. path)
  vim.api.nvim_buf_set_text(buf_tmp, 0, 0, 0, 0, vim.split(fd, "\n"))
  return buf_tmp
end

local function run_query_on_path(path)
  local root_modules_path = path -- returns full path..
  local buf = load_with_file(root_modules_path)
  local buf, root, qp = user_ts_utils.run_query_on_buf("lua", "doom_root_modules", buf)
end

local function parse_root_modules()
  local buf, root, qp = run_query_on_path(
    "lua",
    "doom_root_modules",
    utils.find_config("modules.lua")
  )
  return buf, root, qp
end

--
-- PARSE `MODULES.LUA` AND UPDATE MODULE.
--

-- return
local function parse_and_update_root_modules(m, cb)
  local settings_path = utils.find_config("modules.lua") -- returns full path..
  local buf = load_with_file(settings_path)
  local buf, root, qp = user_ts_utils.run_query_on_buf("lua", "doom_root_modules", buf)
  local sm_ll = 0

  if qp ~= nil then
    for id, node, metadata in qp:iter_captures(root, buf, root:start(), root:end_()) do
      local cname = qp.captures[id] -- name of the capture in the query
      local node_text = tsq.get_node_text(node, buf)
      local p = node:parent()
      local ps = p:prev_sibling()
      if ps ~= nil then -- sometimes is nil, dunno why..
        local pss = ps:prev_sibling()
        if pss ~= nil then
          local section_text = tsq.get_node_text(pss, buf)
          -- print(m.section, section_text)

          if m.section == section_text then
            -- print("RENAME -> ", section_text, ">", node_text)

            sm_ll, _, _, _ = node:range()

            if cb ~= nil then
              cb(buf, node, cname, node_text)
            end
            -- local sr, sc, er, ec = node:range()
            -- -- -- :A/((identifier) @wrapit (#eq? @wrapit "foo"))/wrapit:-- @wrapit/
            --
            -- if name == "modules.enabled" then
            --   local offset = 1
            --   local exact_match = string.match(node_text, m.name)
            --
            --   if exact_match then
            --     vim.api.nvim_buf_set_text(
            --       buf,
            --       sr,
            --       sc + offset,
            --       sr,
            --       sc + offset + string.len(m.name),
            --       { value }
            --     )
            --   end
            -- elseif name == "modules.disabled" then
            --   local offset = 4
            --   local exact_match = string.match(node_text, m.name)
            --   if exact_match then
            --     vim.api.nvim_buf_set_text(
            --       buf,
            --       sr,
            --       sc + offset,
            --       sr,
            --       sc + offset + string.len(m.name),
            --       { value }
            --     )
            --   end
            -- end
          end
        end
      end
    end
  end
  vim.api.nvim_win_set_buf(0, buf)
  return sm_ll + 1 -- return last module row for matched section
end

--
-- ACTION FUNCTIONS -> params: (buf, config, module, telescope_input)
--

local function m_rename(b, c, m, i)
  nui_input("NEW NAME", function(value)
    if not check_if_module_name_exists(c, m, value) then
      print("old name: ", m.name, ", new name:", value)
      local new_name = value

      parse_and_update_root_modules(m, function(buf, node, capt, node_text)
        local sr, sc, er, ec = node:range()
        if capt == "modules.enabled" then
          local offset = 1
          local exact_match = string.match(node_text, m.name)
          if exact_match then
            vim.api.nvim_buf_set_text(
              buf,
              sr,
              sc + offset,
              sr,
              sc + offset + string.len(m.name),
              { value }
            )
          end
        elseif capt == "modules.disabled" then
          local offset = 4
          local exact_match = string.match(node_text, m.name)
          if exact_match then
            vim.api.nvim_buf_set_text(
              buf,
              sr,
              sc + offset,
              sr,
              sc + offset + string.len(m.name),
              { value }
            )
          end
        end
      end)

      -- REFACTOR: pass callback replace func
      -- vim.api.nvim_buf_delete(buf, { force = true, unload = true })
      -- >> write root moduls

      -- 2. change module dir name.
      -- get the module path -> m.path
      --
      --  new path = m.path.strip(tail) .. new_name
      --
      -- shell: mv dir m.path -> new_path
    end
  end)
end

local function m_create(b, c, m, i)
  local new_name
  local for_section

  nui_menu("CONFIRM CREATE", M.settings.confirm_alternatives, function(value)
    if value.text == "yes" then
      new_name = i
      nui_menu("FOR SECTION:", M.settings.section_alternatives, function(value)
        for_section = value.text
        print("create mod: ", name, ", new name:", for_section .. " > " .. new_name)
        if not check_if_module_name_exists(c, { section = nil }, value) then
          local smll = parse_and_update_root_modules({ section = value.text })
          print("smll: ", smll)
          vim.api.nvim_buf_set_lines(buf, smll, smll, true, { '"' .. new_name .. '",' })

          -- 2. create new module

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
      end)
    end
  end)
end

local function m_edit(buf, config, m, i)
  vim.cmd(string.format(":e %s%s%s", m.path, system.sep, "init.lua"))
end

local function m_delete(buf, c, m, i)
  nui_menu("CONFIRM DELETE", M.settings.confirm_alternatives, function(value)
    if value.text == "yes" then
      -- print("delete:", m.section .. " > " .. m.name)

      parse_and_update_root_modules(m, function(buf, node, capt, node_text)
        local sr, sc, er, ec = node:range()
        if capt == "modules.enabled" then
          -- local offset = 1
          local exact_match = string.match(node_text, m.name)
          if exact_match then
            vim.api.nvim_buf_set_text(
              buf,
              sr,
              sc,
              er,
              ec + 1,
              { "" }
            )
          end
        elseif capt == "modules.disabled" then
          -- local offset = 4
          local exact_match = string.match(node_text, m.name)
          if exact_match then
            vim.api.nvim_buf_set_text(
              buf,
              sr,
              sc,
              er,
              ec + 1,
              { "" }
            )
          end
        end
      end)


      -- shell: rm m.path
    end
  end)
end

local function m_toggle(buf, c, m, i)
  print("toggle: ", m.name)
  local buf, root, qp = parse_root_modules()
  local captured_nodes = user_ts_utils.get_captures(root, buf, qp, "modules." .. toggle_state)
  local nodes_by_section = filter_modules_by_cat(buf, captured_nodes, opts.section_name)
  -- user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "-- ")
  -- if opts.enabled then
  --   user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "-- ")
  -- else
  --   -- remove comment
  --   user_ts_utils.ts_nodes_prepend_text(nodes_by_section, buf, "XXX ")
  --   -- print("root modules rm comment > todo..")
  -- end
  -- >> write root moduls
  -- vim.api.nvim_buf_delete(buf, { force = true, unload = true })
end

local function m_move(buf, config)
  -- move module into into (features/langs)
  -- 1. nui menu select ( other sections than self)
  -- 2. move module dir
  -- 3. transform `modules.lua`
end

local function m_merge(buf, config)
  -- 1. new prompt for B
  -- 2. select which module to pull into A
  -- 3. do...
end

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
  local m_sel
  local fuzzy, line = picker_get_state(buf)
  require("telescope.actions").close(buf)

  if fuzzy then
    m_sel = config.entries_mapped[fuzzy.value]
  end

  if action == "CREATE" then
    m_create(buf, config, m_sel, line)
  elseif action == "RENAME" then
    m_rename(buf, config, m_sel, fuzzy.value)
  elseif action == "EDIT" then
    m_edit(buf, config, m_sel, fuzzy.value)
  elseif action == "DELETE" then
    m_delete(buf, config, m_sel, fuzzy.value)
  elseif action == "TOGGLE" then
    m_toggle(buf, config, m_sel, fuzzy.value)
    -- elseif action == "MOVE" then
    -- elseif action == "MERGE" then
    -- elseif action == "BINDS" then
  end
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

-- M.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

M.cmds = {
  {
    "DoomModulesManager",
    function()
      prepare_data_for_picker()
    end,
  },
}

-- M.autocmds = {}
M.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(M.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "D",
        name = "+Doom",
        {
          { "D", [[ :DoomModulesManager<cr> ]], name = "mod.mngr" },
        },
      },
    },
  })
end

return M
