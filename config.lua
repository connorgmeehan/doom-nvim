-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).
local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled
local log = require("doom.utils.logging")
local fs = require("doom.utils.fs")
local system = require("doom.core.system")

doom.moll = {}

-- packer.nvim logs to stdpath(cache)/packer.nvim.log. Looking at this file is usually a good start if something isn't working as expected.

------------------------
---       TODO       ---
------------------------

-- what is a fun async command that I could create / use?
--
--
-- 1. create some kind of intervall timer thing.
-- 2. assign this to the doom user.async["job_name"] = async:new({my_job_opts})
-- 3. call my async process from the commandline and end it / modify it.
--
-- flash color every x seconds.
-- async["my_flasher"]
-- async["my_flasher].set_color = "ABC or toggle color theme.

-- use telescope packe to navigate used plugin dirs
-- create vim command that allows me to select a plugin that I want to fork if it is
-- not already forked etc.
--
-- it would be nice if I could call my `ghm` command from inside of nvim so that
-- I can run this from within nvim with a simple command.
-- canForkCurrentRepo() -> call my function, setup fork, reload vim.

-- when setting up luasnip-snippets > pass the users local snippets dir. so that
-- there is no problem with this.

-- TODO: core module
-- add binds to core that allow you to do very quick and easy inspection
-- of objects.

-- peek 5 > only log 5 first keys of a table to see what kind of pattern it is...

-- would it be possible to do something similar for neovim https://github.com/rhysd/vim.wasm

--telescope-repo > ctrl-w -> create new file and allow edit name > enter  open file

-- debug command!!! > copy visula sel lines and run do file with an appended print(vim.inspect)
-- statement so that anything that one is swiping over can be logged in a super simple  manner.

--get visual selection > use lsp to parse and see what kind of contents is in the selection.
-- then reuse this function in bindings to create snippets / binds.
--
-- OR find require statements on top and  pull them into the command and then do a log
-- so that you can log anything in the visual selection. without anyproblem?

-- lsp refactor / move chunk to new file popup inpet/select new path.

-- use docker to setup dev environments for myself.

-- command > open ranger with a specified path, eg. std('data/config/etc..')

-- prevent LOVE lua sumneko

-- create some more snippet headers level 1, 2, 3, 4, 5, 6

-- need to make macros repeatable.
--

-- i need to add connors nest fork, and look at how it would fit with my new idea of supertight syntax.
--
-- capture.nvim > nest/luasnip

-- i need to override completion commands so that it becomes much easier to navigate through
-- text fast without ever accidentally triggering a snippet or some other shit, because this
-- is very important that this flow is not interrupted.

-- command > input: filetype > enter luasnip correct file type insert after last snippet.

-- open the master binds file > find correct position how? regex? for new position, non leader bind,
-- enter bind to new index, and then write the tree back to the master file. then based on regex,
-- look at each line, and enter the position of the bind if given via input or enter last position before
-- leader.
-- if empty tree then enter tree empty.
--
-- use smart regexes to find positions even if it is in a module file.
--
-- 1. find tree start
-- 2. parse tree / or dofile into environment
-- 3.

-- contact David engelb > whenever I feel ready get in touch with him about 3d modelling.
--

-- ask pwntester how I find some of the correct graphql commands.
-- last time i noticed that I couldn't find all of the commands easilly that he is
-- using, especially the ones pertaining to discussions.
--
-- 1. look at octo and see what search terms and then go to graphql api
-- 2. what was it that I needed to find?
-- 3. ask @pwntester

-- CHECKOUT: tj devries snippets:
--  -> https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/snips/ft/go.lua

-- create a UI framework for neovim that allows you to easilly hook plugins?

-- dorothy bash formatting -> https://duckduckgo.com/?q=vim+bash+specify+formatting+indentation+project&ia=web

-- nui > neogit > use popup for ssh password

---------------------------
---       TESTING       ---
---------------------------

-- https://www.youtube.com/results?search_query=tdd
-- testing w/ plenary thread -> https://www.reddit.com/r/neovim/comments/ms05eq/testing_with_plenary_command_fails/
--
-- neogit is using plenary to write tests. i should study the tests in neogit and
-- learn how to do this type of stuff myself. and then later maybe I can
--
-- this would mean that I should add a makefile to the doom project so that one can run tests on it
-- so I could copy this from neogit and see if I can apply some tests to doom.
-- i dunno how easy this would be
--
--
-- I should apply tdd patterns from plenary and build good tests for doom?
-- do it for the sake of it so that I learn how to to tdd which is good.
--

-- https://github.com/ThePrimeagen/refactoring.nvim/blob/master/lua/refactoring/dev.lua
-- look at this dev lib. should I create something similar for doom? and name the module `dev`
-- i have to learn how lua dev works so that I can leverage those features.

-----------------------------
---       JIBBERISH       ---
-----------------------------

-- the goal was 215 by november, that is at least what I am going to get to but
-- it is so much fun. oh fuck I am moving weight dude. let's do a shot dude.
--
-- i have to look into the refactor project and see how it is done.
-- and so how to get c errors in quickfix list.
--
-- rust/go compiler errors into quickfix. learn how to do this. and get to know
-- quickfix list more in general so that I can get nice automated ways of managing
-- errors and warnings, and I have to see how to qf list works with lsp servers as
-- well and see if I can get an as fast way of getting to errors as possible.
--
-- we don't have anything to hide so that is the reason why they did that probably and so that is something that you might want toggle
-- anders knape. the leader of swedish communes.
--
-- it seems that I should be able to use the treesitter lib and use it since it has a lot of nice helper functions that allow you
-- to do the things that I need. and so that is something that should maybe go into treesitter.
--
-- so how does it feel now to do this
--
-- jibbersish dude
--
--
--
-- !!!! !!

-----------------------------
---       RESOURCES       ---
-----------------------------

-- TEXT
--    dockerfile lab    -> https://docker.github.io/get-involved/docs/communityleaders/eventhandbooks/docker101/dockerfile/#understanding-image-layering-concept-with-dockerfile
--
--    https://www.simplilearn.com/tutorials/docker-tutorial/getting-started-with-docker?source=sl_frs_nav_playlist_video_clicked
--
--
--    dockerfile        -> https://www.simplilearn.com/tutorials/docker-tutorial/what-is-dockerfile
--    docker image      -> https://www.simplilearn.com/tutorials/docker-tutorial/docker-images
--    dockercontainer   -> https://www.simplilearn.com/tutorials/docker-tutorial/what-is-docker-container
--
--    METATABLE
--      https://www.tutorialspoint.com/lua/lua_metatables.htm
--      https://microsoft.github.io/language-server-protocol/specifications/specification-current/
--
--
--    LSP
--      https://microsoft.github.io//language-server-protocol/overviews/lsp/overview/
--
-- VIDEOS
--    nvim from scratch playlist -> https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ
--    lsp config cont@4.30 -> https://www.youtube.com/watch?v=6F3ONwrCxMg&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=8
--
--    docker 3h tutorial -> https://www.youtube.com/watch?v=3c-iBn73dDE

-------------------------
---       PATHS       ---
-------------------------

-- setup a telescope picker with all of there important configr so that
-- I can fuzzy search them and by doing so only need one binding
-- to open the picker and not create a new bind for each path which just
-- clutters up the mappings tree.

local code = "~/code/repos/"
local gh = code .. "github.com/"
doom.moll.github = gh

local xdg_cfg = "$XDG_CONFIG_HOME/dorothy/config.xdg/"
local home_notes = "$HOME/notes/"
local doom_log_path = "$HOME/.local/share/nvim/doom.log"
local aliases_git =
  "$XDG_DATA_HOME/antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh"
local aliases_zsh = "$XDG_CONFIG_HOME/dorothy/sources/aliases.sh"
local conf_doom = "$XDG_CONFIG_HOME/dorothy/config.xdg/doom-nvim/doom_config.lua"
local conf_scim = "$XDG_CONFIG_HOME/dorothy/config.xdg/sc-im/scimrc"
local conf_setup = "$XDG_CONFIG_HOME/dorothy/config/setup.bash"
local conf_alac = xdg_cfg .. "alacritty/alacritty.yml"
local conf_surf = xdg_cfg .. "surfingkeys/config.js"
local conf_skhd = xdg_cfg .. "skhd/skhdrc"
local conf_tmux = xdg_cfg .. "tmux/tmux.conf"
local conf_tnx_main = xdg_cfg .. "tmuxinator/main.yml"
local conf_yabai = xdg_cfg .. "yabai/yabairc"
local notes_rndm = home_notes .. "RNDM.norg"
local notes_todo = home_notes .. "TODO.md"

-------------------------
---       DEBUG       ---
-------------------------

-- local config = vim.tbl_deep_extend("force", {
--   capabilities = utils.get_capabilities(),
--   on_attach = function(client)
--     if not is_plugin_disabled("illuminate") then
--       utils.illuminate_attach(client)
--     end
--     if type(doom.lua.on_attach) == "function" then
--       doom.lua.on_attach(client)
--     end
--   end,
-- })

-- print(vim.inspect(utils.get_capabilities()))
-- print(vim.inspect(utils.illuminate_attach()))
-- print(vim.inspect(doom.lua.on_attach()))

---------------------------
---       OPTIONS       ---
---------------------------

vim.opt.keymap = "INSERT_COLEMAK"

--   · trace
--   · debug
--   · info
--   · warn
--   · error
--   · fatal
doom.logging = "warn"

vim.opt.winwidth = 95

-- -- test add local plugin
-- -- ':lua vim.opt.runtimepath:append("~/code/plugins/nvim/lookup.nvim")',
-- 'set keymap=INSERT_COLEMAK',
-- 'set iminsert=1',
-- 'set imsearch=0',
-- 'let g:surround_no_mappings=1',
-- 'set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case',
-- 'set grepformat=%f:%l:%c:%m',
-- -- 'set noexrc',
-- -- 'set noex',
-- -- -- 'set nosecure',
-- -- 'set ruler',
-- -- 'set autoread',
-- -- 'set laststatus=2',
-- -- 'set splitright',
-- -- 'set splitbelow',
-- -- 'set sidescrolloff=15',
-- -- 'set sidescroll=5',
-- -- 'set equalalways',
-- -- 'set smarttab',
-- -- 'set autoindent',
-- -- 'set cindent',
-- -- 'set smartcase',
-- -- 'set ignorecase',
-- -- 'set showmatch',
-- -- 'set incsearch',
-- -- 'set cmdheight=1',
-- -- 'set showcmd',
-- -- 'set pumblend=17',
-- -- 'set updatetime=1000',
-- -- -- 'set hlsearch',
-- -- 'set breakindent',
-- -- 'set foldmethod=indent',
-- -- 'set linebreak',
-- -- 'set visualbell',
-- -- -- 'set belloff',
-- -- 'set inccommand=split',
-- -- 'set nojoinspaces',
-- -- -- 'set fillchars={ 'eob' = "~" }',

vim.opt.guifont = { "Hack Nerd Font", "h12" }

-- Editor config
doom.indent = 2
doom.autosave = false
doom.escape_sequences = { "zm" }
-- vim.lsp.set_log_level('trace')
vim.diagnostic.config({
  float = {
    source = "always",
  },
})

if doom.modules.tabline then
  doom.modules.tabline.settings.options.diagnostics_indicator = function(_, _, diagnostics_dict, _)
    doom.modules.tabline.settings.options.numbers = nil -- Hide buffer numbers
    local s = ""
    for e, _ in pairs(diagnostics_dict) do
      local sym = e == "error" and " " or (e == "warning" and " " or " ")
      s = s .. sym
    end
    return s
  end
end

---------------------------
---       HELPERS       ---
---------------------------

local function get_system_info_string()
  -- Get the neovim version
  local nvim_vinfo = vim.version()
  local nvim_version = string.format(
    "%d.%d.%d",
    nvim_vinfo.major,
    nvim_vinfo.minor,
    nvim_vinfo.patch
  )
  if nvim_vinfo.api_prerelease then
    nvim_version = nvim_version .. " (dev)"
  end
  -- Get the current OS and if the user is running Linux then get also the
  -- distribution name, e.g. Manjaro
  local user_os = vim.loop.os_uname().sysname
  if user_os == "Linux" then
    user_os = vim.trim(
      -- PRETTY_NAME="Distribution (Additional info)", e.g.
      --	 PRETTY_NAME="Fedora 34 (KDE Plasma)"
      vim.fn.system(
        'cat /etc/os-release | grep "^PRETTY_NAME" | sed '
          .. "'s/^PRETTY_NAME=\"//' | sed "
          .. "'s/\"//'"
      )
    )
  end
  return string.format(
    [[- **OS**: %s
- **Neovim version**: %s
- **Doom Nvim information**:
- **version**: %s
- **`doom_root` variable**: `%s`
- **`doom_configs_root` variable**: `%s`]],
    user_os,
    nvim_version,
    utils.doom_version,
    system.doom_root,
    system.doom_configs_root
  )
end

local function get_error_log_dump()
  -- the reason why the pattern doesn't match is because of the zero infront of single digit days??
  local log_date_format
  local date_pre = os.date("%a %b")
  local date_day = os.date("%d")
  local date_time = "%d%d:%d%d:%d%d"
  local date_year = os.date("%Y")
  local date_day_filtered

  date_day_filtered = date_day:gsub("0", " ")

  log_date_format = date_pre .. " " .. date_day_filtered .. " " .. date_time .. " " .. date_year

  -- print(log_date_format)

  -- Get and save only the warning and error logs from today
  local today_logs = {}
  local doom_logs = vim.split(fs.read_file(system.doom_logs), "\n")
  for _, doom_log in ipairs(doom_logs) do
    if
      string.find(doom_log, "ERROR  " .. log_date_format)
      or string.find(doom_log, "WARN  " .. log_date_format)
    then
      -- print(doom_log)
      table.insert(today_logs, doom_log)
    end
  end
  return string.format(
    [[```
%s
```]],
    table.concat(today_logs, "\n")
  )
end

-- create_report creates a markdown report. It's meant to be used when a bug
-- occurs, useful for debugging issues.
local function create_report()
  local date = os.date("%Y-%m-%d %H:%M:%S")
  local created_report, err = xpcall(function()
    local report = string.format(
      [[# Doom Nvim crash report
> Report date: %s
## System and Doom Nvim information
%s

### Begin error log dump

<details>
%s
</details>

### End log dump]],
      date,
      get_system_info_string(),
      get_error_log_dump()
    )
    fs.write_file(system.doom_report, report, "w+")
    log.info("Report created at " .. system.doom_report)
  end, debug.traceback)
  if not created_report then
    log.error("Error while writing report. Traceback:\n" .. err)
  end
end

-- @param: t
local function add_or_override_plugin(t)
  local user, name = string.match(t[1], "(.*)/(.*)")
  local repo = t[1]
  local local_prefix = t[2]

  -- check if plugin already exists
  if doom.uses[name] == nil then
    doom.uses[name] = {}
  end

  -- prefend repo with local path
  if t[2] ~= nil then
    repo = local_prefix .. repo
  end

  -- override the repo name / if local will the be used
  doom.uses[name][1] = repo

  for k, value in pairs(t) do
    if type(k) ~= "number" then
      doom.uses[name][k] = value
    end
  end
end

-- build nest map tree recursive
local function build_nest_tree(user_tree)
  local t_nest = {}
  for key, user_node in pairs(user_tree) do
    if type(key) == "number" then
      table.insert(t_nest, user_node) -- << LEAF
    elseif type(key) == "string" then
      local new_branch = {
        string.format("%s", key:sub(1, 1)),
        name = string.format("+%s", key:sub(3)),
        build_nest_tree(user_node),
      }
      table.insert(t_nest, new_branch) -- insert branch
    end
  end
  return t_nest
end

-- bool enable/dissable
-- mode keyword add to all binds if it doesn't exist
-- mappings table or key.
local function insert_binds_into_main_table(t)
  local enabled = t[1]
  if enabled then
    local map_tree
    for k, v in pairs(t) do
      if type(k) ~= "number" then
        map_tree = v
        table.insert(doom.binds, map_tree)

        -- if t[2]

        -- if key = table -> normal ??

        -- visual

        -- select

        -- x

        -- terminal

        -- command

        -- -- leader
        -- if k == "leader" then
        --   if not is_plugin_disabled("whichkey") then
        --     table.insert(doom.binds, {
        --       "<leader>",
        --       name = "+prefix",
        --       build_nest_tree(map_tree)
        --     })
        --   end
        -- end
      end
    end
  end
end

doom.moll.bind = insert_binds_into_main_table

local function get_user_input_and_print() end

local function enter_string_into_file() end

-- ```vim
-- :TSBufEnable {module} " enable module on current buffer
-- :TSBufDisable {module} " disable module on current buffer
-- :TSEnableAll {module} [{ft}] " enable module on every buffer. If filetype is specified, enable only for this filetype.
-- :TSDisableAll {module} [{ft}] " disable module on every buffer. If filetype is specified, disable only for this filetype.
-- :TSModuleInfo [{module}] " list information about modules state for each filetype
-- ```

-- #### Incremental selection
--
-- Incremental selection based on the named nodes from the grammar.
--
-- ```vim
-- lua <<EOF
-- require'nvim-treesitter.configs'.setup {
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "gnn",
--       node_incremental = "grn",
--       scope_incremental = "grc",
--       node_decremental = "grm",
--     },
--   },
-- }
-- EOF
-- ```

-- ## Adding queries
--
-- Queries are what `nvim-treesitter` uses to extract information from the syntax tree;
-- they are located in the `queries/{language}/*` runtime directories (see `:h rtp`),
-- like the `queries` folder of this plugin, e.g. `queries/{language}/{locals,highlights,textobjects}.scm`.
-- Other modules may require additional queries such as `folding.scm`.
--
-- All queries found in the runtime directories will be combined.
-- By convention, if you want to write a query, use the `queries/` directory,
-- but if you want to extend a query use the `after/queries/` directory.
--
-- If you want to completely override a query, you can use `:h set_query()`.
-- For example, to override the `injections` queries from `c` with your own:
--
-- ```vim
-- lua <<EOF
-- require("vim.treesitter.query").set_query("c", "injections", "(comment) @comment")
-- EOF
-- ```
--
-- Note: when using `set_query`, all queries in the runtime directories will be ignored.

-- ### Utilities
--
-- You can get some utility functions with
--
-- ```lua
-- local ts_utils = require 'nvim-treesitter.ts_utils'
-- ```
--
-- Check [`:h nvim-treesitter-utils`](doc/nvim-treesitter.txt) for more information.

local function ts_print_context() end

local function create_snippet_for_filetype() end

local function create_bind_tree()

  -- 1. pass tree or empty table
  -- 2. look if write file exists
  -- 3. write tree to this file.
  -- 4. get user input
  -- 5. insert this into the tree that is read into memory.
  -- 6. write tree to the file on enter.
end

-----------------------------
---       FUNCTIONS       ---
-----------------------------

-- ---       HELPER: RELOAD PLUGINS       ---
--
-- P = function(v)
--   print(vim.inspect(v))
--   return v
-- end
--
-- if pcall(require, "plenary") then
--   RELOAD = require("plenary.reload").reload_module
--
--   R = function(name)
--     RELOAD(name)
--     return require(name)
--   end
-- end
--
-- ---       EXPOSED FUNCTIONS       ---
--
-- -- local config = require("doom.core.config").config
-- -- local async = require("doom.modules.built-in.async")
-- -- Set custom functions
-- -- @default = {}
-- -- example:
-- --   {
-- --      {
-- --         hello_custom_func = function()
-- --           print("Hello, custom functions!")
-- --         end,
-- --         -- If the function should be ran on neovim launch or if it should
-- --         -- be a global function accesible from anywhere
-- --         run_on_start = false,
-- --      },
-- --   }
-- return {
-- {
-- 		pp = function(obj)
-- 			print(vim.inspect(obj))
-- 		end,
-- 		run_on_start = false,
--   },
--   -- 1. get str input and print it?
--   -- 2. return modified string how?
-- {
--     esc_str_vimgrep = function() print("esc_str_vimgrep") end,
-- 	  run_on_start = false,
--   },
-- {
--     esc_str_ripgrep = function() print("esc_str_ripgrep") end,
-- 	  run_on_start = false,
--   },
-- 	{
-- 	  toggle_venn = function()
-- 		  local venn_enabled = vim.inspect(vim.b.venn_enabled)
-- 	    if venn_enabled == "nil" then
-- 	      vim.b.venn_enabled = true
-- 	      vim.cmd[[setlocal ve=all]]
-- 	      -- draw a line on HJKL keystokes
-- 	      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
-- 	      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
-- 	      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
-- 	      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
-- 	      -- draw a box by pressing "f" with visual selection
-- 	      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
--       else
-- 	      vim.cmd[[setlocal ve=]]
-- 	      vim.cmd[[mapclear <buffer>]]
-- 	      vim.b.venn_enabled = nil
-- 	    end
-- 	  end,
-- 	  run_on_start = false,
-- 	},
-- 	{
-- 	  run_on_start = false,
--
-- 	},

--
-- 	-- https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
-- 	{
--     moll_reload = function()
--       -- Telescope will give us something like ju/colors.lua,
--       -- so this function convert the selected entry to
--       -- the module name: ju.colors
--       local function get_module_name(s)
--         local module_name;
--
--         module_name = s:gsub("%.lua", "")
--         module_name = module_name:gsub("%/", ".")
--         module_name = module_name:gsub("%.init", "")
--
--         return module_name
--       end
--
--       local prompt_title = "~ neovim modules ~"
--
--       -- sets the path to the lua folder
--       local path = system.doom_root .. "/lua"
--
--       local opts = {
--         prompt_title = prompt_title,
--         cwd = path,
--
--         attach_mappings = function(_, map)
--           -- Adds a new map to ctrl+e.
--           map("i", "<c-e>", function(_)
--             -- these two a very self-explanatory
--             local entry = require("telescope.actions.state").get_selected_entry()
--             local name = get_module_name(entry.value)
--
--             -- call the helper method to reload the module
--             -- and give some feedback
--             R(name)
--             P(name .. " RELOADED!!!")
--           end)
--
--           return true
--         end
--       }
--
--       -- call the builtin method to list files
--       require('telescope.builtin').find_files(opts)
--     end,
-- 	  run_on_start = false,
-- 	},
--
-- }

local funcs = {}

funcs.inspect = function(v)
  print(vim.inspect(v))
  return v
end

-- https://neovim.discourse.group/t/function-that-return-visually-selected-text/1601/2
-- https://github.com/kristijanhusak/neovim-config/blob/master/nvim/lua/partials/search.lua
funcs.get_visual_selection = function()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, "\n")
end

funcs.inspect_visual_sel = function()
  vim.inspect(funcs.get_visual_selection())
end

-- open buffer and read feat req template so that one can quickly
-- document
-- NOTE: I was testing here how to insert text from lua variable
funcs.create_feat_request = function()
  vim.cmd([[ :vert new ]])
  vim.cmd("read " .. system.doom_root .. "/templates/skeleton_feat_request.md")
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_text(bufnr, 5, 0, 5, 0, utils.str_2_table(get_system_info_string(), "\n"))
end

-- open empty buffer and read crash report so that an issue can be
-- documented fast when it occurs
funcs.report_an_issue = function()
  -- functions.create_report()
  create_report()
  vim.cmd([[ :vert new ]])
  -- print(system.doom_report)
  vim.cmd("read " .. system.doom_report)
end

-- funcs.checkPackagesNil = function()
--   local c = 0
--   for k, v in pairs(doom.packages) do
--     if k == nil then
--       print("c", c)
--       c = c + 1
--     end
--   end
--     -- print("xxx")
-- end

doom.moll.funcs = funcs


-------------------------
---       BINDS       ---
-------------------------

-- i shall use functions in as many places as possible.
-- rewrite my bindings when I can.

-- create a binds capture ui that allows you to create new bindings on the fly
-- with a gtd similar workflow.
-- A ui that allows you to step your way down the binds tree, and if you happen
-- to create a new leaf node, then we display the branch and then
-- allow user select what mode, action, name and etc. and then this is inserted
-- into the binds.lua file, in the root folder. this could be quite fucking cool.

-- local binds = {}

local opts = {
  sf = { silent = false },
  n = { noremap = true },
}

-- set / get visual selection
local vs = '"zy'
local viw = '"zyiw'
local viW = '"zyiW'
local vg = "<c-r>z"


local bind = insert_binds_into_main_table -- doom.use_keybind
local enabled = true

-- -- search regex
-- {'n', '/', '/\\v'}, -- need to esc backsl
-- {'v', '/', '/\\v'},

bind({
  enabled,
  normal = {
    { "<c-z>", [[<cmd>suspend<CR>]], name = "suspend vim" },
    { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
    { ";", ":", name = "colon", options = opts.sf },
    { ":", ";", name = "semi-colon" },
    --  {'n', 'dl', ':set wrap! linebreak!<CR>'},
    -- { 'x', 'z', '<Plug>VSurround' },
    -- { 'n', 'yzz', '<Plug>Yssurround' }, -- double ss
    -- { 'n', 'yz', '<Plug>Ysurround' }, -- single s
    -- { 'n', 'dz', '<Plug>Dsurround' },
    -- { 'n', 'cz', '<Plug>Csurround' },
  },
})

-- - local binds_operator = {
-- { 'o', 'b', 'vb', opts.ns },
-- { 'o', 'B', 'vB', opts.ns },
-- { 'o', 'F', 'vF', opts.ns },
-- { 'o', 'T', 'vT', opts.ns },
-- -- { 'o', 's', '<Plug>Lightspeed_s', opts.n },
-- -- { 'o', 'S', '<Plug>Lightspeed_S', opts.ns },
-- }

-- idea > use :[range]luado to filter visual selection.
bind({ -- visual
  enabled,
  visual = {
    { "p", '"_dP', mode = "v", options = opts.fs },
    { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
    {
      "<C-l>v",
      vs .. ":lua doom.moll.funcs.inspect(" .. vg .. ")<Left>",
      name = "inspect",
      options = opts.sf,
      mode = "v",
    },
    {
      "<C-l>i",
      [[:lua doom.moll.funcs.inspect(loadstring(doom.moll.funcs.get_visual_selection()))<CR>]],
      name = "print vis sel",
      options = opts.sf,
      mode = "v",
    },
  },
})

-- insert
bind({
  enabled,
  insert = {
    -- { "i", "zm", "<ESC>:w<cr>", opts_s, "Editor", "exit_insert", "Exit insert mode" },
    { "zf", "<ESC>cF", mode = "i", name = "esc search back", opts.s },
    -- { "i", "zt", "<ESC>cT", opts_s, "Editor", "exit_insert_till_bkw", "Exit insert mode and change Until Backwards" },
    -- { "i", "zD", "<ESC>dF", opts_s, "Editor", "exit_insert_delete_bkw", "Exit insert mode and delete Backwards" },
    -- { "i", "zh", "<ESC>yF", opts_s, "Editor", "exit_insert_yank_bkw", "Exit insert mode and yank Backwards" },
    -- { "i", "zp", "<ESC>la", opts_s, "Editor", "exit_insert_and_append_tiny", "Exit Insert Mode and append right" },
    -- { "i", "zP", "<ESC>A ", opts_s, "Editor", "exit_insert_and_append_big", "Exit Insert Mode and (A)ppend" },
  },
})

local lsp_opts = vim.tbl_extend("force", opts.sf, { expr = true })

bind({ -- lsp
  not enabled,
  lsp = {
    "<c-n>",
    'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"',
    "luasnip_expand",
    options = lsp_opts,
  },
  --     "s", "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
  --     "s", "<c-p>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
  --     "s", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_s",
  --     "s", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_s",
  --     "i", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_i_insert",
  --     "i", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_i_insert",
  --     "i", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice",
  --     "s", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice_s",
})

-- { 't', '<esc>', 'command', 'option'},
-- local binds_terminal = {
-- }

if is_module_enabled("whichkey") then
  bind({
    enabled,
    leader = {
      "<leader>",
      name = "+prefix",
      {
        -- {
        --     "h", name = "+help", {
        --       -- { "n", "<leader>hm", ":Man ", { silent = false }, "Man Page", "man_page", "Man Page" },
        --       -- { "n", "<leader>hl", ":help lua_reference_toc<CR>", { silent = false }, "Lua Reference", "lua_reference", "Lua Reference" },
        --       -- { "n", "<leader>hw", "\"zyiw:h <c-r>z<cr>", { silent = false }, "Help Inner Word", "help_inner_word", "Inner Word" },
        --       -- { "n", "<leader>hh", ":help ", { silent = false }, "Help", "help", "Help" },
        --       -- { "n", "<leader>hc", "<cmd>helpc<cr>", { silent = false }, "Close Help", "close_help", "Close Help" },
        --     }
        --   }, -- help
        -- {
        --     "n", name = "neorg", {
        --       -- { 'n', '<leader>nd', ':Neorg workspace default_workspace<cr>', opts.n },
        --       -- { 'n', '<leader>nn', ':Neorg workspace notes<cr>', opts.n },
        --       -- { 'n', '<leader>nG', ':Neorg workspace gtd<cr>', opts.n },
        --       -- { 'n', '<leader>nE', ':Neorg workspace example_gtd<cr>', opts.n },
        --       -- { 'n', '<leader>ng', ':Neorg gtd ', opts.n },
        --       -- { 'n', '<leader>nc', ':Neorg gtd capture<cr>', opts.n },
        --       -- { 'n', '<leader>ne', ':Neorg gtd edit', opts.n },
        --       -- { 'n', '<leader>nv', ':Neorg gtd views<cr>', opts.n },
        --     }
        --   }, -- neorg -> move to leader > open > neorg
        {
          "M",
          name = "+moll",
          {
            {
              "l",
              [[<cmd>lua require("luasnip_snippets").load_snippets()<CR>]],
              name = "load luasnip-snippets",
            },
            { "r", [[<cmd>DoomReload<CR>]], name = "doomReload" },
            {
              "R",
              function()
                doom.moll.funcs.report_an_issue()
              end,
              name = "create_issue_from_templ",
            },
            {
              "p",
              [[:lua doom.moll.funcs.inspect(doom.)<Left>]],
              name = "inspect",
              options = opts.sf,
            },
            {
              "P",
              [[:lua doom.moll.funcs.inspect()<Left>]],
              name = "inspect",
              options = opts.sf,
            },
            {
              "w",
              '"zyiw:lua doom.moll.funcs.inspect(<c-r>z)<Left>',
              name = "inspect iw",
              options = opts.sf,
            },
            {
              "W",
              '"zyiW:lua doom.moll.funcs.inspect(<c-r>z)<Left>',
              name = "inspect iW",
              options = opts.sf,
            },
            { "t", '<cmd>TermExec cmd="zsh -il"<cr>', name = "terminal zsh -il" },
            -- {
            --     "e", name = "+TEST", {
            --       -- -- https://github.com/jbyuki/nabla.nvim#usage
            --       -- { 'n', '<F5>', '<cmd>lua require("nabla").action()<cr>', opts.n },
            --       -- { 'n', '<leader>Tp', '<cmd>lua require("nabla").popup()<cr>', opts.n },
            --       -- -- vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
            --       -- { 'n', '<leader>N', ':lua toggle_venn()<CR>', opts.n },
            --           --       -- require("plenary.reload").reload_module(selection.value)
            --           -- -- { 'n', '<leader>lr', ':lua require("telescope.builtin").reloader({ cwd = ' .. test_plugin_reload .. '})<cr>', opts.n },
            --           -- { 'n', '<leader>lr', ':lua require("plenary.reload").reload_module(' .. test_plugin_reload .. ')<cr>', opts.n },
            --           -- { 'n', '<leader>lR', ':lua report_an_issue()<cr>', opts.n },
            --           -- { 'n', '<leader>lp', ':lua pp()<left>', opts.n },
            --
            --     }
            --   },
            {
              "g",
              name = "+go",
              {
                { "D", "<cmd>e " .. doom_log_path .. "<CR>" },
                { "N", "<cmd>e " .. notes_rndm .. "<CR>" },
                { "S", "<cmd>e " .. conf_skhd .. "<CR>" },
                { "a", "<cmd>e " .. conf_alac .. "<CR>" },
                { "d", "<cmd>e " .. conf_doom .. "<CR>" },
                { "e", "<cmd>e " .. conf_setup .. "<CR>" },
                { "g", "<cmd>e " .. aliases_git .. "<CR>" },
                { "m", "<cmd>e " .. conf_tnx_main .. "<CR>" },
                { "n", "<cmd>e " .. notes_todo .. "<CR>" },
                { "s", "<cmd>e " .. conf_surf .. "<CR>" },
                { "t", "<cmd>e " .. conf_tmux .. "<CR>" },
                { "x", "<cmd>e " .. conf_scim .. "<CR>" },
                { "y", "<cmd>e " .. conf_yabai .. "<CR>" },
                { "z", "<cmd>e " .. aliases_zsh .. "<CR>" },
              },
            }, -- moll > go
            -- {
            --     "L", name = "+line operations", {
            --       -- -- line operations (testing)
            --       -- -- " run current line through shell
            --       -- { 'n', ',Zs', '!!$SHELL <CR>'},
            --       -- -- " run current line in commandline
            --       -- { 'n', ',Zl', 'yy:@" <CR>' },
            --       -- ??
            --       -- { 'n', ',ZZ', ':w !sudo tee %'},
            --     }
            --   }
          },
        }, -- moll
        -- {
        --     "P", name ="+path", { -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
        -- -- - file path to global
        -- -- - file git root global nvim
        -- -- - active file buffer
        -- -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
        -- { "n", "<leader>fpa", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_active_file", ":cd active file" },
        -- { "n", "<leader>fpg", "<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_current_git_root", ":cd active git root" },
        --       -- {
        --       -- 	"n",
        --       -- 	"<leader>fpa",
        --       -- 	"<cmd>cd %:p:h<CR><cmd>pwd<CR>",
        --       -- 	opts.s,
        --       -- 	"Editor",
        --       -- 	"cwd_to_active_file",
        --       -- 	":cd active file",
        --       -- },
        --       -- {
        --       -- 	"n",
        --       -- 	"<leader>fpg",
        --       -- 	"<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>",
        --       -- 	opts.s,
        --       -- 	"Editor",
        --       -- 	"cwd_to_current_git_root",
        --       -- 	":cd active git root",
        --       -- },
        --     }
        --   },
        {
          "s",
          name = "+search",
          {
            { "g", [[<cmd>Telescope repo cached_list<CR>]], name = "repos cached" },
            { "G", [[<cmd>Telescope repo list<CR>]], name = "repos build" },
            { "f", [[/\v\c]], name = "text case", options = opts.sf },
            {
              "r",
              name = "+replace",
              {
                { "l", ":s//g<Left><Left>", name = "line", options = opts.sf },
                { "L", '"zyiw:s/<c-r>z//g<Left><Left>', name = "line iw", options = opts.sf },
                { "o", '"zyiW:s/<c-r>z//g<Left><Left>', name = "line iW", options = opts.sf },
                {
                  "O",
                  '"zyiw:s/\\<<c-r>z\\>//g<Left><Left>',
                  name = "line iw solo",
                  options = opts.sf,
                },
                { "a", ":%s//g<Left><Left>", name = "file", options = opts.sf },
                { "w", '"zyiw:%s/<c-r>z//g<Left><Left>', name = "word", options = opts.sf },
                --
                -- {
                --    "n",
                --    "<leader>rfs",
                --    "\"zyiw:%s/\\<<c-r>z\\>//g<Left><Left>",
                --    { silent = false },
                --    "Replace Inner (w)ord Solo",
                --    "replace_inner_word_solo",
                --    "Replace (w)ord Solo"
                -- },
                -- {
                --    "n",
                --    "<leader>rfW",
                --    "\"zyiW:%s/<c-r>z//g<Left><Left>",
                --    { silent = false },
                --    "Replace Inner (W)ord",
                --    "replace_inner_word_big",
                --    "Replace (W)ord"
                -- },
              },
            }, -- search > replace
            {
              "R",
              name = "+grep/cdo",
              {
                -- -- ripgrep search empty
                -- {
                --    "n",
                --    "<leader>rg",
                --    ":grep ",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },
                -- -- ripgrep search word
                -- {
                --    "n",
                --    "<leader>rw",
                --    "\"zyiw:grep <c-r>z",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },
                -- -- ripgrep search WORD
                -- {
                --    "n",
                --    "<leader>rW",
                --    "\"zyiW:grep <c-r>z",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },

                -- -- TODO: add vimgrep variants
                -- -- vimgrep search empty
                -- {
                --    "n",
                --    "<leader>rg",
                --    ":grep ",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },
                -- -- vimgrep search word
                -- {
                --    "n",
                --    "<leader>rw",
                --    "\"zyiw:grep <c-r>z",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },
                -- -- vimgrep search WORD
                -- {
                --    "n",
                --    "<leader>rW",
                --    "\"zyiW:grep <c-r>z",
                --    { silent = false },
                --    "Ripgrep Search Empty",
                --    "ripgrep_search_empty",
                --    "Ripgrep Search Empty"
                -- },
                -- -- vimgrep search word solo
                -- -- vimgrep search WORD solo
                -- -- :cdo empty
                -- {
                --    "n",
                --    "<leader>rce",
                --    ":cdo s//gc<Left><Left><Left>",
                --    { silent = false },
                --    "Quickfix cdo Empty",
                --    "quickfix_cdo_empty",
                --    "Quickfix cdo Empty"
                -- },
                -- -- :cdo replace word
                -- {
                --    "n",
                --    "<leader>rcw",
                --    "\"zyiw:cdo s/<c-r>z//gc<Left><Left><Left>",
                --    { silent = false },
                --    "Quickfix cdo (w)ord",
                --    "quickfix_cdo_word_small",
                --    "Quickfix cdo (w)ord",
                -- },
                -- -- :cdo replace WORD
                -- {
                --    "n",
                --    "<leader>rcW",
                --    "\"zyiW:cdo s/<c-r>z//gc<Left><Left><Left>",
                --    { silent = false },
                --    "Quickfix cdo (W)ord",
                --    "quickfix_cdo_word_big",
                --    "Quickfix cdo (W)ord",
                -- },
                -- -- :cdo solo word
                -- {
                --    "n",
                --    "<leader>rcs",
                --    "\"zyiw:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
                --    { silent = false },
                --    "Quickfix cdo solo (w)ord",
                --    "quickfix_cdo_solo_word_small",
                --    "Quickfix cdo solo(w)ord",
                -- },
                -- -- :cdo solo WORD
                -- {
                --    "n",
                --    "<leader>rcS",
                --    "\"zyiW:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
                --    { silent = false },
                --    "Quickfix cdo solo (W)ord",
                --    "quickfix_cdo_solo_word_big",
                --    "Quickfix cdo solo (W)ord",
                -- },
              },
            },
          },
        }, -- search
        {
          "g",
          name = "+git",
          {
            {
              "z",
              name = "+octo",
              {
                { "i", ":Octo issue ", name = "issue", options = opts.sf },
                { "l", "<cmd>Octo issue list<cr>", name = "issue list" },
              },
            }, -- git -> octo
            -- {
            --     "x", name = "+vgit", {
            --
            --     }
            --   }, -- git -> vgit
            -- {
            --     "Z", name = "+gitsigns", {
            --
            --     }
            --   }, -- git -> gitsigns
            -- {
            --     "d", name = "+diffview", {
            --
            --     }
            --   }, -- git -> gitsigns
          },
        }, -- git
        -- {
        --     "R", "+readf", {
        --       -- -- read file
        --       -- -- :r file               to after cursor
        --       -- -- :$r                   to end of buffer
        --       -- -- :0r                   to end of buffer
        --       -- -- :{x}r                 to after line x
        --       -- -- :/pattern/r file      to after pattern
        --       -- { 'n', ',Rf', ':r<space>' },
        --       -- { 'n', ',Re', ':$r<space>' },
        --       -- { 'n', ',Rb', ':0r<space>' },
        --       -- { 'n', ',Rl', ':r <Left><Left>' },
        --       -- { 'n', ',Rp', '://r <Left><Left><Left>' },
        --     }
        --   }, -- read
        {
          "w",
          name = "+windows",
          {
            { "z", [[<esc><cmd>suspend<CR>]], name = "suspend vim" },
            -- { "S", [[<esc><CR>]], name = "solo window / close all others" }, -- nvim get windows > compare some idx/name > close match set
            -- { "move"}
            -- { "new/rm"}
            -- {
            --     "t", name = "+tabs", {
            --       -- { 'n', ',tn', ':tabnew<cr>' },
            --       -- { 'n', 'gl', 'gt' },
            --       -- { 'n', 'gL', 'gT' },
            --       -- { 'n', ',g0', ':tabr<cr>' },
            --       -- { 'n', ',g$', ':tabl<cr>' },
            --       -- { 'n', ',gh', ':tabm -<cr>' },
            --       -- { 'n', ',gl', ':tabm +<cr>' },
            --     }
            --   }
          },
        }, -- windows
      }, -- leader
    },
  })
end

---------------------------
---------------------------
---       PLUGINS       ---
---------------------------
---------------------------

local use = doom.use_package
local m = doom.modules

---------------------------
---       EDITING       ---
---------------------------

use({ "jamessan/vim-gnupg" })
use({ "nanotee/nvim-lua-guide" }) -- additional help under :h nvim-lua-guid
use({ "romainl/vim-cool" }) -- disable highlights automatically on cursor move
use({ "tpope/vim-surround" }) -- cs`' to change `` to '', etc
use({ "tpope/vim-repeat" })
use({ "itspriddle/vim-stripper" }) -- strip whitespace on save
use({ "drzel/vim-line-no-indicator" }) -- nice scroll indicator
use({ "stevearc/aerial.nvim" })
use({ "kevinhwang91/nvim-bqf" })
use({
  "ggandor/lightspeed.nvim",
  config = function()
    require("lightspeed").setup({
      ignore_case = false,
      exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },

      --- s/x ---
      jump_to_unique_chars = { safety_timeout = 400 },
      match_only_the_start_of_same_char_seqs = true,
      force_beacons_into_match_width = false,
      -- Display characters in a custom way in the highlighted matches.
      substitute_chars = { ["\r"] = "¬" },
      -- Leaving the appropriate list empty effectively disables "smart" mode,
      -- and forces auto-jump to be on or off.
      -- safe_labels = { . . . },
      -- labels = { . . . },
      -- These keys are captured directly by the plugin at runtime.
      special_keys = {
        next_match_group = "<space>",
        prev_match_group = "<tab>",
      },

      --- f/t ---
      limit_ft_matches = 4,
      repeat_ft_with_target_char = false,
    })
  end,
})
use({
  "beauwilliams/focus.nvim",
  config = function()
    require("focus").setup()
  end,
})
use({ "s1n7ax/nvim-search-and-replace" })
use({ "airblade/vim-rooter" })
-- { 'oberblastmeister/nvim-rooter' },
-- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end },
-- https://github.com/sindrets/winshift.nvim
-- { 'https://github.com/justinmk/vim-dirvish' },
-- git@github.com:steelsojka/pears.nvim.git

-- https://github.com/mg979/vim-visual-multi -- TODO: try this one.
--		convert this one to lua

-----------------------
---       GIT       ---
-----------------------

m.neogit.packages["neogit"][1] = gh .. "TimUntersberger/neogit"

----------------------------
---       SNIPPETS       ---
----------------------------

-- --- test generate annotation with neogen
-- local snippets = doom.modules.snippets
--
-- --- another neogen commment
-- snippets.packages["LuaSnip"][1] = gh .. "L3MON4D3/LuaSnip"
--
-- table.insert(snippets.packages["LuaSnip"].requires, {
--   "molleweide/LuaSnip-snippets.nvim", -- opt = true,
-- })
--
-- --- here neogen works but not for the table insert above
-- snippets.configs["LuaSnip"] = function()
--   local ls = require("luasnip")
--   ls.config.set_config(snippets.settings)
--   ls.snippets = require("luasnip_snippets").load_snippets()
--   require("luasnip.loaders.from_vscode").load()
-- end

----------------------------------------
---       TELESCOPE EXTENSIONS       ---
----------------------------------------

use({ gh .. "cljoly/telescope-repo.nvim" })
use({ gh .. "nvim-telescope/telescope-packer.nvim" })

-- -- -- add ext to tele config
table.insert(doom.modules.telescope.settings.extensions, "repo")
table.insert(doom.modules.telescope.settings.extensions, "packer")


-------------------------------------
---       CMP NVIM OVERRIDE       ---
-------------------------------------

-- lsp.configure_functions["nvim-cmp"] = function()
--   local cmp = require("cmp")
--   local luasnip = require("luasnip")
--   local replace_termcodes = require("doom.utils").replace_termcodes
--
--   local source_map = {
--     nvim_lsp = "[LSP]",
--     luasnip = "[Snp]",
--     buffer = "[Buf]",
--     nvim_lua = "[Lua]",
--     path = "[Path]",
--   }
--
--   --- Helper function to check what <Tab> behaviour to use
--   --- @return boolean
--   local function check_backspace()
--     local col = vim.fn.col(".") - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
--   end
--
--   -- Initalize the cmp toggle if it doesn't exist.
--   if _doom.cmp_enable == nil then
--     _doom.cmp_enable = true
--   end
--
--   cmp.setup(vim.tbl_deep_extend("force", doom.modules.lsp.settings.completion, {
--     completeopt = nil,
--     completion = {
--       completeopt = doom.modules.lsp.settings.completion.completeopt,
--     },
--     formatting = {
--       format = function(entry, item)
--         item.kind = string.format("%s %s", doom.modules.lsp.settings.completion.kinds[item.kind], item.kind)
--         item.menu = source_map[entry.source.name]
--         item.dup = vim.tbl_contains({ "path", "buffer" }, entry.source.name)
--         return item
--       end,
--     },
--     mapping = {
--       ["<C-p>"] = cmp.mapping.select_prev_item(),
--       ["<C-n>"] = cmp.mapping.select_next_item(),
--       ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-Space>"] = cmp.mapping.complete(),
--       ["<C-e>"] = cmp.mapping.close(),
--       -- ["<ESC>"] = cmp.mapping.close(),
--       ["<C-j>"] = cmp.mapping.confirm({
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true,
--       }),
--       ["<C-l>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--         elseif luasnip.expand_or_jumpable() then
--           vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
--         elseif check_backspace() then
--           vim.fn.feedkeys(replace_termcodes("<Tab>"), "n")
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--       ["<C-k>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-jump-prev"), "")
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
--   }, {
--     mapping = type(doom.modules.lsp.settings.completion.mapping) == "function" and doom.modules.lsp.settings.completion.mapping(cmp)
--       or doom.modules.lsp.settings.completion.mapping,
--     enabled = function()
--       return _doom.cmp_enable and vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
--     end,
--   }))
-- end

--------------------------
---       CONNOR       ---
--------------------------

-- doom.colorscheme = "tokyonight"

-- Extra packages
doom.use_package(
  "rafcamlet/nvim-luapad",
  "nvim-treesitter/playground",
  "dstein64/vim-startuptime"
)

doom.use_cmd({
  "Test",
  function()
    print("test")
  end,
})

doom.use_autocmd({
  {
    "FileType",
    "lua",
    function()
      print("lua")
    end,
  },
})

-- vim: sw=2 sts=2 ts=2 expandtab
