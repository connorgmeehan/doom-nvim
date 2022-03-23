-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).
local utils = require("doom.utils")
local is_plugin_disabled = utils.is_plugin_disabled
local log = require("doom.utils.logging")
local fs = require("doom.utils.fs")
local system = require("doom.core.system")

doom.moll = {}

-- packer.nvim logs to stdpath(cache)/packer.nvim.log. Looking at this file is usually a good start if something isn't working as expected.
--

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

local xdg_cfg			    = "$XDG_CONFIG_HOME/dorothy/config.xdg/"
local home_notes	        = "$HOME/notes/"
local doom_log_path	        = "$HOME/.local/share/nvim/doom.log"
local aliases_git			= '$XDG_DATA_HOME/antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh'
local aliases_zsh			= '$XDG_CONFIG_HOME/dorothy/sources/aliases.sh'
local conf_doom 			= '$XDG_CONFIG_HOME/dorothy/config.xdg/doom-nvim/doom_config.lua'
local conf_scim 			= '$XDG_CONFIG_HOME/dorothy/config.xdg/sc-im/scimrc'
local conf_setup			= '$XDG_CONFIG_HOME/dorothy/config/setup.bash'
local conf_alac				= xdg_cfg .. 'alacritty/alacritty.yml'
local conf_surf				= xdg_cfg .. 'surfingkeys/config.js'
local conf_skhd				= xdg_cfg .. 'skhd/skhdrc'
local conf_tmux				= xdg_cfg .. 'tmux/tmux.conf'
local conf_tnx_main 	= xdg_cfg .. 'tmuxinator/main.yml'
local conf_yabai			= xdg_cfg .. 'yabai/yabairc'
local notes_rndm			= home_notes .. 'RNDM.norg'
local notes_todo			= home_notes .. 'TODO.md'

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

vim.opt.keymap = 'INSERT_COLEMAK'

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

vim.opt.guifont = { 'Hack Nerd Font', 'h12' }

-- Editor config
doom.indent = 2
doom.autosave = false
doom.escape_sequences = { 'zm' }
-- vim.lsp.set_log_level('trace')
vim.diagnostic.config({
  float = {
    source = 'always',
  },
})

if doom.modules.tabline then
  doom.modules.tabline.settings.options.diagnostics_indicator = function (_, _, diagnostics_dict, _)
  doom.modules.tabline.settings.options.numbers = nil; -- Hide buffer numbers
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
	  "%d.%d.%d", nvim_vinfo.major, nvim_vinfo.minor, nvim_vinfo.patch
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
    system.doom_configs_root)
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
```]], table.concat(today_logs, "\n"))
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
  if doom.packages[name] == nil then
    doom.packages[name] = {}
  end

  -- prefend repo with local path
  if t[2] ~= nil then
    repo = local_prefix .. repo
  end

  -- override the repo name / if local will the be used
  doom.packages[name][1] = repo

  for k, value in pairs(t) do
    if type(k) ~= "number" then
        doom.packages[name][k] = value
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
        string.format("%s", key:sub(1,1)),
        name = string.format("+%s", key:sub(3)),
        build_nest_tree(user_node)
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

local function get_user_input_and_print()

end

local function enter_string_into_file()

end

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

local function ts_print_context()

end

local function create_snippet_for_filetype()

end


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
  return table.concat(lines, '\n')
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
	vim.api.nvim_buf_set_text(bufnr, 5,0,5,0, utils.str_2_table(get_system_info_string(), "\n"))
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


----------------------------
---       AUTOCMDS       ---
----------------------------

  -- doom.autocmds[augroup_name] = {
  --   { "BufReadPre", "*.lua", "setlocal sw=2", --[[once and nested are boolean keys here]] },
  --   { "InsertEnter", "*", function() print("Lua functions are valid!") end, once = true }
  -- }

--    tmux_reload = {
--     { 'BufWritePost', '~/.config/tmux/tmux.conf', '! tmux source-file ~/.config/tmux/tmux.conf'}
-- },

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
	sf  = { silent = false },
	n  = {  noremap = true },
}

-- set / get visual selection
local vs = "\"zy"
local viw = "\"zyiw"
local viW = "\"zyiW"
local vg = "<c-r>z"

-----------------------------
---       READ FILE       ---
-----------------------------

-- -- navigation + rm arrows
-- {'i', '<Down>', '<Nop>' },
-- {'i', '<Left>', '<Nop>' },
-- {'i', '<Right>', '<Nop>' },
-- {'i', '<Up>', '<Nop>' },
-- {'n', '<Down>', '<Nop>' },
-- {'n', '<Left>', '<Nop>' },
-- {'n', '<Right>', '<Nop>' },
-- {'n', '<Up>', '<Nop>' },
-- {'v', '<Down>', '<Nop>' },
-- {'v', '<Left>', '<Nop>' },
-- {'v', '<Right>', '<Nop>' },
-- {'v', '<Up>', '<Nop>' },

-- -- ctrl move
-- {'i','<c-l>','<space>'},
-- {'c','<c-l>','<space>'},

------------------------------
---       formatting       ---
------------------------------

-- { "n", "<leader>ai", "mzgg=G`z<cr>", opts.s, "Format", "indent_file", "Indent File" },
-- { "n", "<leader>au", "viwUe", opts.s, "Format", "upper_case", "Word Upper" },
-- { "n", "<leader>aU", "viwue", opts.s, "Format", "lower_case", "Word Lower" },

----------------------------------
---       todo quicklist       ---
----------------------------------

-- { 'n', '<leader>Tq', '<cmd>TodoQuickFix<cr>',  {}, "Quick Fix", "todo_quick_fix", "Todo Quick Fix" },
-- { 'n', '<leader>Tt', '<cmd>TodoTrouble<cr>',   {}, "Trouble",   "todo_trouble", "Todo Trouble" },
-- { 'n', '<leader>Te', '<cmd>TodoTelescope<cr>', {}, "Telescope", "todo_telescope", "Todo Telescope" },
-- { 'n', '<leader>Tl', '<cmd>TodoLocList<cr>',   {}, "LocList",   "todo_loc_list", "Todo LocList" },

--------------------------------------------
---       SEARCH & REPLACE               ---
--------------------------------------------

-- get v sel
--  https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
-- THESE TWO HAVE THE BEST SUGGESTIONS
-- https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/
-- https://phelipetls.github.io/posts/extending-vim-with-ripgrep/

-- https://www.freecodecamp.org/news/how-to-search-and-replace-across-multiple-files-in-vim/
-- https://stackoverflow.com/questions/37424689/search-and-replace-in-multiple-files-using-vim
-- https://irian.to/blogs/how-to-search-and-replace-string-across-multiple-files-in-vim/
-- https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers
-- https://www.reddit.com/r/vim/comments/n8x2xr/til_find_and_replace_multiple_files_with_and/
-- https://github.com/brooth/far.vim

-------------------------------------------------
---       SEARCH POPULATE QUICKFIX LIST       ---
-------------------------------------------------


--------------------------------------------------
---       REPLACE WORDS IN QUICKFIX LIST       ---
--------------------------------------------------

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

-----------------------
---       GIT       ---
-----------------------

-- TODO:
--
--  git reset
--	unstage all
--
--	split hunk ???????????????????????
--
--	reset hunk
--	reset buffer
--	reset hunk
--
--	partial hunks // https://github.com/lewis6991/gitsigns.nvim/pull/411

-- WHICH-KEY TREE
-- ["l"] = {
--   name = "+git-test",
--   ["zo"] = { "open lazygit" },
-- },

-- -- 1. unstage all
-- { 'n', '<leader>lgr', '<cmd>!git reset<cr>', opts.s },
-- -- 2. unstage all and stagu hunk under cursor
-- -- 3. triple -> unstage all, select at cursor, and commit
-- -- 4. unstage all and commit only current buffer.

-- -- NEOGIT
-- -- :Neogit " uses tab
-- -- :Neogit kind=<kind> " override kind
-- -- :Neogit cwd=<cwd> " override cwd
-- -- :Neogit commit" open commit popup
-- -- { 'n', '<leader>lnh', '<cmd>lua require("neogit").open({ kind = "vsplit", cwd = "~" })<CR>', opts.s},
-- { 'n', '<leader>lj', '<cmd>Neogit<CR>', opts.s},
-- { 'n', '<leader>lnc', '<cmd>Neogit commit<CR>', opts.s},
-- { 'n', '<leader>lnl', '<cmd>Neogit pull<CR>', opts.s}, -- TODO: pull
-- { 'n', '<leader>lnp', '<cmd>Neogit push<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lnb', '<cmd>Neogit branch<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lnv', '<cmd>Neogit log<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lns', '<cmd>Neogit stash<CR>', opts.s}, -- TODO: push

-- -- -- GITSIGNS
-- { 'n', '<leader>lsn', '<cmd>lua require("gitsigns").next_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsp', '<cmd>lua require("gitsigns").prev_hunk()<CR>', opts.s},
-- { 'n', '<leader>lss', '<cmd>lua require("gitsigns").stage_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsu', '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsb', '<cmd>lua require("gitsigns").stage_buffer()<CR>', opts.s},
-- -- TODO: diffthiss > diffview hunk at cursor
-- -- -- TODO: undo buffer
-- -- toggle_signs()
-- -- 	toggle_numhl()
-- -- 	toggle_linehl()
-- -- 	toggle_word_diff()
-- -- 	toggle_current_line_blame()
-- -- 	refresh()

-- -- -- DIFFVIEW
-- { 'n', '<leader>ldh', '<cmd>DiffviewOpen<CR>', opts.s},
-- { 'n', '<leader>ldc', '<cmd>DiffviewClose<CR>', opts.s},
-- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s},
-- -- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s}, -- TODO: prev commit
-- -- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s}, -- TODO: HEAD prev HEAD

-- -- -- VGIT
-- { 'n', '<leader>lvb', '<cmd>lua require("vgit").buffer_hunk_preview()<CR>', opts.s},
-- { 'n', '<leader>lV', '<cmd>vgit<CR>', opts.s},

-- -- -- LAZYGIT
-- -- mappings.map("n", "<leader>go", "<cmd>LazyGit<CR>", opts, "Git", "lazygit", "Open LazyGit")
-- { 'n', '<leader>lzo', '<cmd>LazyGit<CR>', opts.s},

------------------------------
---       lightspeed       ---
------------------------------
-- https://github.com/ggandor/lightspeed.nvim/discussions/83
-- `<Plug>Lightspeed_s`  2-character  forward   /-like
-- `<Plug>Lightspeed_S`  2-character  backward  ?-like
-- `<Plug>Lightspeed_x`  2-character  forward   X-mode
-- `<Plug>Lightspeed_X`  2-character  backward  X-mode

-- `<Plug>Lightspeed_f`  1-character  forward   f-like
-- `<Plug>Lightspeed_F`  1-character  backward  F-like
-- `<Plug>Lightspeed_t`  1-character  forward   t-like
-- `<Plug>Lightspeed_T`  1-character  backward  T-like



----------------------------
---       surround       ---
----------------------------

-- -- map ds       <Plug>Dsurround
-- -- nmap cs       <Plug>Csurround
-- -- nmap cS       <Plug>CSurround
-- -- nmap ys       <Plug>Ysurround
-- -- nmap yS       <Plug>YSurround
-- -- nmap yss      <Plug>Yssurround
-- -- nmap ySs      <Plug>YSsurround
-- -- nmap ySS      <Plug>YSsurround
-- -- xmap gs       <Plug>VSurround
-- -- xmap gS       <Plug>VgSurround
-- normal mode

-- local bind = function(t)
--   print(t[1], t[2])
--   -- enabled?
--   if t[1] then
--     for key, mappings in pairs(t) do
--       print("type: ", type(key), key)
--       if type(key) ~= "number" then
--         print(key, "<<<<")
--         table.insert(doom.binds, mappings)
--       end
--     end
--   end
-- end

local bind = insert_binds_into_main_table -- doom.use_keybind
local enabled = true
local disabled = false

-- -- search regex
-- {'n', '/', '/\\v'}, -- need to esc backsl
-- {'v', '/', '/\\v'},

bind {
  enabled,
  normal = {
  { "<c-z>", [[<cmd>suspend<CR>]], name = "suspend vim" },
  { "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
  { ';', ':', name = "colon", options = opts.sf },
  { ':', ';', name = "semi-colon" }
    --  {'n', 'dl', ':set wrap! linebreak!<CR>'},
    -- { 'x', 'z', '<Plug>VSurround' },
    -- { 'n', 'yzz', '<Plug>Yssurround' }, -- double ss
    -- { 'n', 'yz', '<Plug>Ysurround' }, -- single s
    -- { 'n', 'dz', '<Plug>Dsurround' },
    -- { 'n', 'cz', '<Plug>Csurround' },
  }
}

-- - local binds_operator = {
-- { 'o', 'b', 'vb', opts.ns },
-- { 'o', 'B', 'vB', opts.ns },
-- { 'o', 'F', 'vF', opts.ns },
-- { 'o', 'T', 'vT', opts.ns },
-- -- { 'o', 's', '<Plug>Lightspeed_s', opts.n },
-- -- { 'o', 'S', '<Plug>Lightspeed_S', opts.ns },
-- }



--------------------------
---       CONNOR       ---
--------------------------






-- Colourscheme
doom.use_package('sainnhe/sonokai', 'EdenEast/nightfox.nvim')
local options = {
  dim_inactive = true,
}
local pallets = {
  dawnfox = {
    bg2 = '#F9EFEC',
    bg3 = '#ECE3DE',
    sel1 = '#EEF1F1',
    sel2 = '#D8DDDD',
  }
}
local specs = {
}
local groups = {
  TelescopeNormal = { fg = 'fg0', bg = 'bg0' },
  TelescopePromptTitle = { fg = "pallet.green", bg = "bg1" },
  TelescopePromptBorder = { fg = "bg1", bg = "bg1" },
  TelescopePromptNormal = { fg = "fg1", bg = "bg1" },
  TelescopePromptPrefix = { fg = "fg1", bg = "bg1" },

  TelescopeResultsTitle = { fg = "pallet.green", bg = "bg2" },
  TelescopeResultsBorder = { fg = 'bg2', bg = 'bg2' },
  TelescopeResultsNormal = { fg = 'fg1', bg = 'bg2' },

  TelescopePreviewTitle = { fg = "pallet.green", bg = "bg1" },
  TelescopePreviewNormal = { bg = 'bg1' },
  TelescopePreviewBorder = { fg = "bg1", bg = "bg1" },
  TelescopeMatching = { fg = "error" },
  CursorLine = { bg = "sel1", link = "" },
}
require('nightfox').setup({
  options = options,
  pallets = pallets,
  specs = specs,
  groups = groups,
})
doom.colorscheme = 'dawnfox'

-- Extra packages
doom.use_package(
  'rafcamlet/nvim-luapad',
  'nvim-treesitter/playground',
  'tpope/vim-surround',
  'dstein64/vim-startuptime'
)

doom.use_cmd({
  'Test', function() print('test') end
})

doom.use_autocmd({
  {"FileType", "lua", function() print('lua') end }
})

-- vim: sw=2 sts=2 ts=2 expandtab
