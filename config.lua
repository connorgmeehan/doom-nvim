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

-- i am learning more and more about this shit and it is something that isn2
-- mariopoll, my config file is huge at the moment. i have pretty much added every single plugin that
-- i can find that seems interesting so that I know that they are in my code and
-- then I can just disable them easilly should I need.
--
-- allright so now i am going to do some more stretching and then make it so tha this this.
-- jag saog vad det var for machine that you guys got yourself.



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

-- Editor config
doom.indent = 2

-- vim.lsp.set_log_level('trace')
vim.diagnostic.config({
  float = {
    source = 'always',
  },
})

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

funcs.checkPackagesNil = function()
  local c = 0
  for k, v in pairs(doom.packages) do
    if k == nil then
      print("c", c)
      c = c + 1
    end
  end
    -- print("xxx")
end

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

local binds = {}

local opts = {
	sf  = { silent = false },
	n  = {  noremap = true },
}

-- set / get visual selection
local vs = "\"zy"
local viw = "\"zyiw"
local viW = "\"zyiW"
local vg = "<c-r>z"

------------------------
---       TABS       ---
------------------------

-- { 'n', ',tn', ':tabnew<cr>' },
-- { 'n', 'gl', 'gt' },
-- { 'n', 'gL', 'gT' },
-- { 'n', ',g0', ':tabr<cr>' },
-- { 'n', ',g$', ':tabl<cr>' },
-- { 'n', ',gh', ':tabm -<cr>' },
-- { 'n', ',gl', ':tabm +<cr>' },

-----------------------------
---       READ FILE       ---
-----------------------------

-- -- read file
-- -- :r file               to after cursor
-- -- :$r                   to end of buffer
-- -- :0r                   to end of buffer
-- -- :{x}r                 to after line x
-- -- :/pattern/r file      to after pattern
-- { 'n', ',Rf', ':r<space>' },
-- { 'n', ',Re', ':$r<space>' },
-- { 'n', ',Rb', ':0r<space>' },
-- { 'n', ',Rl', ':r <Left><Left>' },
-- { 'n', ',Rp', '://r <Left><Left><Left>' },

-- -- line operations (testing)
-- -- " run current line through shell
-- { 'n', ',Zs', '!!$SHELL <CR>'},
-- -- " run current line in commandline
-- { 'n', ',Zl', 'yy:@" <CR>' },
-- ??
-- { 'n', ',ZZ', ':w !sudo tee %'},

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

-- -- search regex
-- {'n', '/', '/\\v'}, -- need to esc backsl
-- {'v', '/', '/\\v'},

---------------------------------
---       esc sequenses       ---
---------------------------------

-- { "i", "zm", "<ESC>:w<cr>", opts_s, "Editor", "exit_insert", "Exit insert mode" },
-- { "i", "zf", "<ESC>cF", opts_s, "Editor", "exit_insert_change_bkw", "Exit insert mode and change Backwards" },
-- { "i", "zt", "<ESC>cT", opts_s, "Editor", "exit_insert_till_bkw", "Exit insert mode and change Until Backwards" },
-- { "i", "zD", "<ESC>dF", opts_s, "Editor", "exit_insert_delete_bkw", "Exit insert mode and delete Backwards" },
-- { "i", "zh", "<ESC>yF", opts_s, "Editor", "exit_insert_yank_bkw", "Exit insert mode and yank Backwards" },
-- { "i", "zp", "<ESC>la", opts_s, "Editor", "exit_insert_and_append_tiny", "Exit Insert Mode and append right" },
-- { "i", "zP", "<ESC>A ", opts_s, "Editor", "exit_insert_and_append_big", "Exit Insert Mode and (A)ppend" },

---------------------------------
---       help commands       ---
---------------------------------

-- { "n", "<leader>hm", ":Man ", { silent = false }, "Man Page", "man_page", "Man Page" },
-- { "n", "<leader>hl", ":help lua_reference_toc<CR>", { silent = false }, "Lua Reference", "lua_reference", "Lua Reference" },
-- { "n", "<leader>hw", "\"zyiw:h <c-r>z<cr>", { silent = false }, "Help Inner Word", "help_inner_word", "Inner Word" },
-- { "n", "<leader>hh", ":help ", { silent = false }, "Help", "help", "Help" },
-- { "n", "<leader>hc", "<cmd>helpc<cr>", { silent = false }, "Close Help", "close_help", "Close Help" },

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

-------------------------------
---       paths & :cd       ---
-------------------------------

-- -- - file path to global
-- -- - file git root global nvim
-- -- - active file buffer
-- -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
-- { "n", "<leader>fpa", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_active_file", ":cd active file" },
-- { "n", "<leader>fpg", "<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>", opts.s, "Editor", "cwd_to_current_git_root", ":cd active git root" },

--------------------------------------------
---       search & replace: visual       ---
--------------------------------------------

-- get v sel
--  https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript


------------------------------------------
---       search & replace: file       ---
------------------------------------------
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
--
-------------------------------------------
---       search mult files links       ---
-------------------------------------------

-- THESE TWO HAVE THE BEST SUGGESTIONS
-- https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/
-- https://phelipetls.github.io/posts/extending-vim-with-ripgrep/

-- https://www.freecodecamp.org/news/how-to-search-and-replace-across-multiple-files-in-vim/
-- https://stackoverflow.com/questions/37424689/search-and-replace-in-multiple-files-using-vim
-- https://irian.to/blogs/how-to-search-and-replace-string-across-multiple-files-in-vim/
-- https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers
-- https://www.reddit.com/r/vim/comments/n8x2xr/til_find_and_replace_multiple_files_with_and/
-- https://github.com/brooth/far.vim

-------------------------------
---       paths & :cd       ---
-------------------------------

-- -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
-- {
-- 	"n",
-- 	"<leader>fpa",
-- 	"<cmd>cd %:p:h<CR><cmd>pwd<CR>",
-- 	opts.s,
-- 	"Editor",
-- 	"cwd_to_active_file",
-- 	":cd active file",
-- },
-- {
-- 	"n",
-- 	"<leader>fpg",
-- 	"<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>",
-- 	opts.s,
-- 	"Editor",
-- 	"cwd_to_current_git_root",
-- 	":cd active git root",
-- },
--
-------------------------------------------------
---       SEARCH POPULATE QUICKFIX LIST       ---
-------------------------------------------------

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

-------------------------
---       NEORG       ---
-------------------------

-- { 'n', '<leader>nd', ':Neorg workspace default_workspace<cr>', opts.n },
-- { 'n', '<leader>nn', ':Neorg workspace notes<cr>', opts.n },
-- { 'n', '<leader>nG', ':Neorg workspace gtd<cr>', opts.n },
-- { 'n', '<leader>nE', ':Neorg workspace example_gtd<cr>', opts.n },
-- { 'n', '<leader>ng', ':Neorg gtd ', opts.n },
-- { 'n', '<leader>nc', ':Neorg gtd capture<cr>', opts.n },
-- { 'n', '<leader>ne', ':Neorg gtd edit', opts.n },
-- { 'n', '<leader>nv', ':Neorg gtd views<cr>', opts.n },

--------------------------------
---       NABLA / VENN       ---
--------------------------------

-- -- https://github.com/jbyuki/nabla.nvim#usage
-- { 'n', '<F5>', '<cmd>lua require("nabla").action()<cr>', opts.n },
-- { 'n', '<leader>Tp', '<cmd>lua require("nabla").popup()<cr>', opts.n },
-- -- vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
-- { 'n', '<leader>N', ':lua toggle_venn()<CR>', opts.n },

-----------------------
---       VAR       ---
-----------------------

--       -- require("plenary.reload").reload_module(selection.value)
-- -- { 'n', '<leader>lr', ':lua require("telescope.builtin").reloader({ cwd = ' .. test_plugin_reload .. '})<cr>', opts.n },
-- { 'n', '<leader>lr', ':lua require("plenary.reload").reload_module(' .. test_plugin_reload .. ')<cr>', opts.n },
-- { 'n', '<leader>lR', ':lua report_an_issue()<cr>', opts.n },
-- { 'n', '<leader>lp', ':lua pp()<left>', opts.n },

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
local binds_normal = {
{ "<c-z>", [[<cmd>suspend<CR>]], name = "suspend vim" },
{ "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
{ ';', ':', name = "colon", options = opts.sf },
{ ':', ';', name = "semi-colon" },
--  {'n', 'dl', ':set wrap! linebreak!<CR>'},
-- { 'x', 'z', '<Plug>VSurround' },
-- { 'n', 'yzz', '<Plug>Yssurround' }, -- double ss
-- { 'n', 'yz', '<Plug>Ysurround' }, -- single s
-- { 'n', 'dz', '<Plug>Dsurround' },
-- { 'n', 'cz', '<Plug>Csurround' },
}

-- local binds_operator = {
-- { 'o', 'b', 'vb', opts.ns },
-- { 'o', 'B', 'vB', opts.ns },
-- { 'o', 'F', 'vF', opts.ns },
-- { 'o', 'T', 'vT', opts.ns },
-- -- { 'o', 's', '<Plug>Lightspeed_s', opts.n },
-- -- { 'o', 'S', '<Plug>Lightspeed_S', opts.ns },
-- }

-- idea > use :[range]luado to filter visual selection.
local binds_visual = {
{ "p", '"_dP', mode = "v", options = opts.fs },
{ "<c-z>", [[<Esc><cmd>suspend<CR>]], name = "suspend vim", mode = "v" },
{ "<C-l>v", vs .. ":lua doom.moll.funcs.inspect(".. vg .. ")<Left>", name = "inspect", options = opts.sf, mode = "v" },
{
    "<C-l>i",
    [[:lua doom.moll.funcs.inspect(loadstring(doom.moll.funcs.get_visual_selection()))<CR>]],
    name = "print vis sel",
    options = opts.sf, mode = "v"
  },
}

local lsp_opts = vim.tbl_extend("force", opts.sf, { expr = true })

local binds_snippets = {
  { "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', "luasnip_expand", options = lsp_opts }
--     "s", "<c-n>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--     "s", "<c-p>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', lsp_opts, "luasnip_expand",
--     "s", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_s",
--     "s", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_s",
--     "i", "<c-k>", '<cmd>lua require("luasnip").jump(1)<CR>', opts, "luasnip_next_sel_i_insert",
--     "i", "<c-j>", '<cmd>lua require("luasnip").jump(-1)<CR>', opts, "luasnip_prev_sel_i_insert",
--     "i", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice",
--     "s", "<C-E>", 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', lsp_opts, "luasnip_next_choice_s",
}

-- { 't', '<esc>', 'command', 'option'},
-- local binds_terminal = {
-- }

local binds_leader = {
  "<leader>", name = "+prefix", {
  {
      "M", name = "+moll", {
      { "l", [[<cmd>lua require("luasnip_snippets").load_snippets()<CR>]], name = "load luasnip-snippets" },
      { "r", [[<cmd>DoomReload<CR>]], name = "doomReload" },
      { "R", function() doom.moll.funcs.report_an_issue() end, name = "create_issue_from_templ"},
      { "p", [[:lua doom.moll.funcs.inspect(doom.)<Left>]], name = "inspect", options = opts.sf },
      { "P", [[:lua doom.moll.funcs.inspect()<Left>]], name = "inspect", options = opts.sf },
      { "w", "\"zyiw:lua doom.moll.funcs.inspect(<c-r>z)<Left>", name = "inspect iw", options = opts.sf },
      { "W", "\"zyiW:lua doom.moll.funcs.inspect(<c-r>z)<Left>", name = "inspect iW", options = opts.sf },
      { 't', '<cmd>TermExec cmd="zsh -il"<cr>'},
      {
          "g", name = "+go", {
          { 'D', '<cmd>e '.. doom_log_path ..'<CR>' },
          { 'N', '<cmd>e '.. notes_rndm ..'<CR>' },
          { 'S', '<cmd>e '.. conf_skhd ..'<CR>' },
          { 'a', '<cmd>e '.. conf_alac ..'<CR>' },
          { 'd', '<cmd>e '.. conf_doom ..'<CR>' },
          { 'e', '<cmd>e '.. conf_setup ..'<CR>' },
          { 'g', '<cmd>e '.. aliases_git ..'<CR>' },
          { 'm', '<cmd>e '.. conf_tnx_main ..'<CR>' },
          { 'n', '<cmd>e '.. notes_todo ..'<CR>' },
          { 's', '<cmd>e '.. conf_surf ..'<CR>' },
          { 't', '<cmd>e '.. conf_tmux ..'<CR>' },
          { 'x', '<cmd>e '.. conf_scim ..'<CR>' },
          { 'y', '<cmd>e '.. conf_yabai ..'<CR>' },
          { 'z', '<cmd>e '.. aliases_zsh ..'<CR>' },
          },
        }, -- moll > go
      },
    }, -- moll
  {
      "s", name = "+search", {
      { "g", [[<cmd>Telescope repo cached_list<CR>]], name = "repos cached" },
      { "G", [[<cmd>Telescope repo list<CR>]], name = "repos build" },
      { "f", [[/\v\c]], name = "text case", options = opts.sf },
      {
          "r", name = "+replace", {
          { "l", ":s//g<Left><Left>", name = "line", options = opts.sf },
          { "L", "\"zyiw:s/<c-r>z//g<Left><Left>", name = "line iw", options = opts.sf },
          { "o", "\"zyiW:s/<c-r>z//g<Left><Left>", name = "line iW", options = opts.sf },
          { "O", "\"zyiw:s/\\<<c-r>z\\>//g<Left><Left>", name = "line iw solo", options = opts.sf },
          { "a", ":%s//g<Left><Left>", name = "file", options = opts.sf },
          { "w", "\"zyiw:%s/<c-r>z//g<Left><Left>", name = "word", options = opts.sf },
          }
        }, -- search > replace
    },
  }, -- search
  {
      "g", name = "+git", {
      {
          "z", name = "+octo", {
          { "i", ":Octo issue ", name = "issue", options = opts.sf },
          { "l", "<cmd>Octo issue list<cr>", name = "issue list" },
          },
        }, -- git -> octo
      },
    }, -- git
  {
      "w", name = "+windows", {
      { "z", [[<esc><cmd>suspend<CR>]], name = "suspend vim" },
      -- { "S", [[<esc><CR>]], name = "solo window / close all others" }, -- nvim get windows > compare some idx/name > close match set
      -- { "move"}
      -- { "new/rm"}
      },
    }, -- windows
  } -- leader
}

table.insert(doom.binds, binds_normal)
table.insert(doom.binds, binds_visual)
-- table.insert(doom.binds, binds_terminal)
if not is_plugin_disabled("whichkey") then table.insert(doom.binds, binds_leader) end


---------------------------
---------------------------
---------------------------
---       PLUGINS       ---
---------------------------
---------------------------
---------------------------

local use = require("doom.utils.user").add_or_override_plugin

-- Connors plugins
use{ 'rafcamlet/nvim-luapad' }
use{ 'nvim-treesitter/playground' }

---------------------------------
---       COLOR SCHEMES       ---
---------------------------------

use { 'xiyaowong/nvim-transparent', config = require("molleweide.configs.transparent") }
use { 'bluz71/vim-moonfly-colors' }
use { 'bluz71/vim-nightfly-guicolors' }
use { 'projekt0n/github-nvim-theme' }
use { 'Pocco81/Catppuccino.nvim' }
use { 'sainnhe/sonokai' }
use { 'folke/tokyonight.nvim', config = require("molleweide.configs.tokyonight") }

doom.colorscheme = 'tokyonight'

------------------------------
---       NAVIGATION       ---
------------------------------

---------------------------------
---       PLUGINS | LUA       ---
---------------------------------

use { "milisims/nvim-luaref" } -- move this to dev module.

---------------------------
---       EDITING       ---
---------------------------

use { 'jamessan/vim-gnupg' }
use { 'nanotee/nvim-lua-guide' }         -- additional help under :h nvim-lua-guid
use { 'romainl/vim-cool' }               -- disable highlights automatically on cursor move
use { 'tpope/vim-surround' }             -- cs`' to change `` to '', etc
use { 'tpope/vim-repeat'}
use { 'itspriddle/vim-stripper' }        -- strip whitespace on save
use { 'drzel/vim-line-no-indicator' }   -- nice scroll indicator
use { 'stevearc/aerial.nvim' }
use { 'mbbill/undotree' }                -- visualize undo tree
use { "kevinhwang91/nvim-bqf" }
use { 'ggandor/lightspeed.nvim', config = require("molleweide.configs.lightspeed"), }
use { 'beauwilliams/focus.nvim', config = function() require('focus').setup() end }
use { "s1n7ax/nvim-search-and-replace" }
use { 'airblade/vim-rooter' }
-- { 'oberblastmeister/nvim-rooter' },
-- { 'ldelossa/litee.nvim', config = require('molleweide.plugins.litee') },
-- { 'ldelossa/litee-calltree.nvim' },
-- { 'ldelossa/litee-symboltree.nvim' },
-- { 'ldelossa/litee-filetree.nvim' },
-- { 'ldelossa/litee-bookmarks.nvim' },
-- { 'nvim-pack/nvim-spectre', config = require('molleweide.plugins.nvim-spectre') },
-- { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end },
-- https://github.com/sindrets/winshift.nvim
-- { 'romgrk/nvim-treesitter-context', config = function() require('molleweide.plugins.nvim-treesitter-context').setup({}) end }, -- BUG: nvim-treesitter-context gives error on startup
-- { 'https://github.com/justinmk/vim-dirvish' },
-- git@github.com:steelsojka/pears.nvim.git

-- https://github.com/mg979/vim-visual-multi -- TODO: try this one.
--		convert this one to lua


------------------------
---       MISC       ---
------------------------

use { 'christoomey/vim-tmux-navigator' }
use { 'melonmanchan/vim-tmux-resizer' }
use { 'benmills/vimux' }
use { 'godlygeek/tabular' }
use { 'vim-scripts/excel.vim' }
use { 'kjnh10/ExcelLikeVim' }
use { 'davidgranstrom/scnvim', run = ":call scnvim#install()", config = require("molleweide.configs.scnvim") }
use { 'ThePrimeagen/vim-be-good' }
use { 'rajasegar/vim-search-web' } -- fast looku
use { 'KabbAmine/vCoolor.vim' } -- open color picker / requires mouse to select color
use { "jbyuki/venn.nvim", config = require("molleweide.configs.venn") }
use { "jbyuki/nabla.nvim" } -- , config = require("molleweide.configs.nabla")
use { "jbyuki/quickmath.nvim" } -- calculator
  -- { 'saifulapm/chartoggle.nvim' },
  -- { "AndrewRadev/switch.vim" },
  -- { "jszakmeister/vim-togglecursor" },
  -- { "Yohannfra/Vim-Flip.git" },
  -- { "elentok/togglr.vim.git" },

-----------------------
---       GIT       ---
-----------------------

use { 'TimUntersberger/neogit', gh }
use { 'tanvirtin/vgit.nvim', event = 'BufWinEnter', requires = { 'nvim-lua/plenary.nvim', }, config = require("molleweide.configs.vgit") }
use { "sindrets/diffview.nvim", config = require("molleweide.configs.diffview") }
use {
	'pwntester/octo.nvim',
	requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
	config = require("molleweide.configs.octo")
}
-- { 'f-person/git-blame.nvim' },
-- { 'ruifm/gitlinker.nvim' },
-- { 'rlch/github-notifications.nvim' },
-- { 'rmagatti/igs.nvim' },
-- { 'kyoh86/gitstat.nvim' },
-- { 'knsh14/githublink.nvim' },
-- { 'antonk52/gitignore-grabber.nvim' },
-- { 'petertriho/cmp-git' }, -- wip / unstable..


---------------------------------------------
---       OLD / DEPRECATED / UNUSED       ---
---------------------------------------------

-- { 'justinmk/vim-sneak' },             --       should be even faster than easymotion
-- { 'easymotion/vim-easymotion' },  --
--
--

----------------------------------------------
---       NEW PLUGINS / NOT USED YET       ---
----------------------------------------------

-- https://github.com/jbyuki/instant.nvim
-- https://github.com/TimUntersberger/neofs
-- https://github.com/SmiteshP/nvim-gps
-- https://github.com/danielpieper/telescope-tmuxinator.nvim
-- https://github.com/fedeizzo/nvim-printer
-- git@github.com:DanielWeidinger/nvim-sshfs.git
-- https://github.com/ThePrimeagen/refactoring.nvim -- <<<<<<<<<<<< https://martinfowler.com/books/refactoring.html
-- https://github.com/clojure-vim/clj-refactor.nvim

-------------------------------------
---       LOCAL / OVERRIDES       ---
-------------------------------------

--
-- -- add requires luasnip
-- plug({ "molleweide/LuaSnip-snippets.nvim", opt = true, after = "LuaSnip" })
-- -- -- table.insert(doom.packages["LuaSnip"].requires, { "molleweide/LuaSnip-snippets.nvim", opt = true })
-- doom.packages["LuaSnip"].config = function()
--   require("luasnip").config.set_config(doom.snippets)
--   require("luasnip").snippets = require("luasnip_snippets").load_snippets()
--   require("luasnip.loaders.from_vscode").load()
-- end

----------------------------------------
---       TELESCOPE EXTENSIONS       ---
----------------------------------------

use { 'cljoly/telescope-repo.nvim', gh }
use { 'nvim-telescope/telescope-packer.nvim', gh }

-- -- -- add ext to tele config
table.insert(doom.modules.telescope.settings.extensions, 'repo')
table.insert(doom.modules.telescope.settings.extensions, 'packer')

-- table.insert(telescope.ext) ??

-- TODO: neorg
-- git@github.com:nvim-neorg/neorg-telescope.git

-- requires https://github.com/cli/cli#installation
-- { "nvim-telescope/telescope-github.nvim", config = function() local telescope = require("telescope") telescope.load_extension("gh") end },

-- { "nvim-telescope/telescope-z.nvim", config = function() local telescope = require("telescope") telescope.load_extension("z") end }, -- navigate with z compatibles
-- { "nvim-telescope/telescope-ghq.nvim"}, -- remote repo managment for `https://github.com/x-motemen/ghq`
-- { 'cljoly/telescope-repo.nvim' } ) -- local git repos NOTE: I am using local version!!!

-- {
--   'nvim-telescope/telescope-project.nvim',
--   config = function()
--     local telescope = require("telescope")
--     telescope.load_extension("project")
--     vim.api.nvim_set_keymap(
--       'n',
--       '<leader>TT',
--       ":lua require'telescope'.extensions.project.project{}<CR>",
--       {noremap = true, silent = true}
--     )
--   end
-- }, -- navigate projects / similar to repo above

-- :Telescope cheat fd
-- :Telescope cheat recache " cheat will be auto cached with new updates on sources
-- {
--   "nvim-telescope/telescope-cheat.nvim",
--   requires = "tami5/sqlite.lua",
--   rocks = { "sqlite", "luv" },
--   config = function() local telescope = require("telescope") telescope.load_extension("cheat") end
-- }, -- search shell stuff

-- { "TC72/telescope-tele-tabby.nvim" }, -- manage tabs
-- { "dhruvmanila/telescope-bookmarks.nvim" }, -- web bookmarks
-- { "nvim-telescope/telescope-bibtex.nvim" }, -- tex references
-- { "nvim-telescope/telescope-node-modules.nvim" },
-- { "xiyaowong/telescope-emoji.nvim" },
-- { "crispgm/telescope-heading.nvim" },
-- { "benfowler/telescope-luasnip.nvim", config = function() local telescope = require("telescope") telescope.load_extension("luasnip") end  },
-- { "nvim-telescope/telescope-frecency.nvim" }, -- kind of like telescop internal `z`
-- { "teleivo/telescope-test.nvim" },

-- {
--   "rudism/telescope-dict.nvim",
--   config = function() local telescope = require("telescope") telescope.load_extension("dict")
--     vim.api.nvim_set_keymap(
--       'n',
--       '<leader>TD',
--       ":lua require('telescope').extensions.dict.synonyms()<CR>",
--       {noremap = true, silent = true}
--     )
--   end
-- }, -- how to install dicts??

-- { "nvim-telescope/telescope-media-files.nvim " }, -- onlylinux for now. theyre looking into hologram.nvim
-- { "jvgrootveld/telescope-zoxide" },
-- { "rmagatti/session-lens" }, -- require rmagatti auto-sessions looks very cool
-- {
--     "nvim-telescope/telescope-arecibo.nvim",
--     rocks = { "openssl", "lua-http-parser" },
-- }, -- search web

-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/LinArcX/telescope-command-palette.nvim
-- https://github.com/renerocksai/telekasten.nvim
-- https://github.com/davidgranstrom/telescope-scdoc.nvim
-- https://github.com/Josiah-tan/quick-projects-nvim
-- https://github.com/keyvchan/telescope-find-pickers.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/fcying/telescope-ctags-outline.nvim
-- https://github.com/nvim-neorg/neorg-telescope
-- https://github.com/IllustratedMan-code/telescope-conda.nvim
-- https://github.com/AckslD/nvim-neoclip.lua
-- https://github.com/EthanJWright/vs-tasks.nvim
-- https://github.com/luissimas/telescope-nodescripts.nvim
-- https://github.com/psiska/telescope-hoogle.nvim -- requires local install of hoogle
-- https://github.com/tigorlazuardi/telescope-cd.nvim
-- https://github.com/tamago324/telescope-openbrowser.nvim -- https://github.com/tyru/open-browser.vim
-- https://github.com/ok97465/telescope-py-importer.nvim
-- https://github.com/camgraff/telescope-tmux.nvim
-- https://github.com/ok97465/telescope-py-outline.nvim
-- https://github.com/crispgm/telescope-heading.nvim

------------------------------
---       ASYNC JOBS       ---
------------------------------

-- Example: repeating timer
--     1. Save this code to a file.
--     2. Execute it with ":luafile %". >


-- -- Create a timer handle (implementation detail: uv_timer_t).
-- local timer = vim.loop.new_timer()
-- local i = 0
-- -- Waits 1000ms, then repeats every 750ms until timer:close().
-- timer:start(1000, 750, function()
--   print('timer invoked! i='..tostring(i))
--   if i > 4 then
--     timer:close()  -- Always close handles to avoid leaks.
--   end
--   i = i + 1
-- end)
-- print('sleeping');

-- Example: File-change detection                          *watch-file*
--     1. Save this code to a file.
--     2. Execute it with ":luafile %".
--     3. Use ":Watch %" to watch any file.
--     4. Try editing the file from another text editor.
--     5. Observe that the file reloads in Nvim (because on_change() calls
--        |:checktime|). >

-- local w = vim.loop.new_fs_event()
-- local function on_change(err, fname, status)
--   -- Do work...
--   vim.api.nvim_command('checktime')
--   -- Debounce: stop/start.
--   w:stop()
--   watch_file(fname)
-- end
-- function watch_file(fname)
--   local fullpath = vim.api.nvim_call_function(
--     'fnamemodify', {fname, ':p'})
--   w:start(fullpath, {}, vim.schedule_wrap(function(...)
--     on_change(...) end))
-- end
-- vim.api.nvim_command(
--   "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

-- Example: TCP echo-server                                *tcp-server*
--     1. Save this code to a file.
--     2. Execute it with ":luafile %".
--     3. Note the port number.
--     4. Connect from any TCP client (e.g. "nc 0.0.0.0 36795"): >

-- With a server setup like this it should be possible to use reaper as a server
-- and then recieve playhead message and which would make vim into an editor,
-- given that I understand how I can parse reaper projects into nvim.
--
-- plugin -> `rpp-daw-client.nvim`
--
-- which listens for events coming from reaper. this would mean that I now
-- can compare which client is better. reapers or the original. at least,
-- this is a fun project just for learning how to interface with programs.
--
-- 1. read basic project data into buffer.
-- 2. update playhead color column every message.
--
-- if buffer = reaper_project >> use custom mappings/which-tree for rpp production.

-- local function create_server(host, port, on_connect)
--   local server = vim.loop.new_tcp()
--   server:bind(host, port)
--   server:listen(128, function(err)
--     assert(not err, err)  -- Check for errors.
--     local sock = vim.loop.new_tcp()
--     server:accept(sock)  -- Accept client connection.
--     on_connect(sock)  -- Start reading messages.
--   end)
--   return server
-- end
-- local server = create_server('0.0.0.0', 0, function(sock)
--   sock:read_start(function(err, chunk)
--     assert(not err, err)  -- Check for errors.
--     if chunk then
--       sock:write(chunk)  -- Echo received messages to the channel.
--     else  -- EOF (stream closed).
--       sock:close()  -- Always close handles to avoid leaks.
--     end
--   end)
-- end)
-- print('TCP echo-server listening on port: '..server:getsockname().port)


-- vim: sw=2 sts=2 ts=2 expandtab
