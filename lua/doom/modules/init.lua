local utils = require("doom.utils")
local use_floating_win_packer = doom.use_floating_win_packer
local log = require("doom.utils.logging")
local system = require("doom.core.system")

local doom_modules = {}

function doom_modules.start()
  -- Packer Bootstrapping
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    log.info("Bootstrapping packer.nvim, please wait ...")
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    })
  end

  -- Load packer
  local packer = require("packer")

  -- Change some defaults
  -- Of particular interest is compile_path: we use stdpath("data"), so as to not
  -- have anything generated in Doom source (which goes in stdpath("config")).
  packer.init({
    compile_path = system.doom_compile_path,
    git = {
      clone_timeout = 300, -- 5 mins
      subcommands = {
        -- Prevent packer from downloading all branches metadata to reduce cloning cost
        -- for heavy size plugins like plenary (removed the '--no-single-branch' git flag)
        install = "clone --depth %i --progress",
      },
    },
    display = {
      open_fn = use_floating_win_packer and function()
        return require("packer.util").float({ border = doom.border_style })
      end,
    },
    profile = {
      enable = true,
    },
    log = {
      level = doom.logging,
    },
  })

  packer.reset()
end

local function check_for_local_forks(name, spec)
  local function apply_reload_autocmd_to_local_fork(name, repo_path)
    local repo_lua_path = string.format("%s%slua", repo_path, system.sep)
    local autocmd_pattern = string.format("%s%s%s", repo_path, system.sep, "**/*.lua")
    local scan_dir = require("plenary.scandir").scan_dir
    local reload_module = require("plenary.reload").reload_module
    local scan_dir_opts = { search_pattern = ".", depth = 1, only_dirs = true }
    utils.make_augroup(name .. "_autoreloader", {
      {
        "BufWritePost",
        autocmd_pattern,
        function()
          if doom.reload_local_plugins then
            local t_lua_module_paths = scan_dir(vim.fn.expand(repo_lua_path), scan_dir_opts)
            local t_lua_module_names = vim.tbl_map(function(s)
              return s:match("/([_%w]-)$") -- capture only dirname
            end, t_lua_module_paths)
            for _, mname in ipairs(t_lua_module_names) do
              print("reload module name:", mname)
              reload_module(mname)
            end
          end
        end,
      },
    })
    log.info(string.format([[Create local reloader autocmd for: %s]], repo_path:match("/([_%w%.%-]-)$")))
  end

  local repo_path = spec[1]
  local function is_local_path(s)
    return s:match("^~") or s:match("^/")
  end
  if is_local_path(repo_path) then
    apply_reload_autocmd_to_local_fork(name, repo_path)
  end
  if spec.requires ~= nil then
    for _, rspec in pairs(spec.requires) do
      local rspec_repo_path = rspec
      if type(rspec) == "table" then
        rspec_repo_path = rspec[1]
      end
      if is_local_path(rspec_repo_path) then
        apply_reload_autocmd_to_local_fork(rspec[1]:match("/([_%w%.%-]-)$"), rspec[1])
      end
    end
  end
end

function doom_modules.load_modules()
  local use = require("packer").use
  -- Handle the Modules
  for module_name, module in pairs(doom.modules) do
    -- Import dependencies with packer from module.packages
    if module.packages then
      for dependency_name, packer_spec in pairs(module.packages) do
        -- Set packer_spec to configure function
        if module.configs and module.configs[dependency_name] then
          packer_spec.config = module.configs[dependency_name]
        end

        -- Set/unset frozen packer dependencies
        packer_spec.commit = doom.freeze_dependencies and packer_spec.commit or nil

        check_for_local_forks(dependency_name, packer_spec)

        -- Initialise packer
        use(packer_spec)
      end
    end

    -- Setup package autogroups
    if module.autocmds then
      local autocmds = type(module.autocmds) == "function" and module.autocmds() or module.autocmds
      utils.make_augroup(module_name, autocmds)
    end

    if module.cmds then
      for _, cmd_spec in ipairs(module.cmds) do
        utils.make_cmd(cmd_spec[1], cmd_spec[2])
      end
    end
  end
end

function doom_modules.handle_user_config()
  local use = require("packer").use

  -- Handle extra user modules
  for _, packer_spec in ipairs(doom.packages) do
    use(packer_spec)
  end

  -- Handle extra user cmds
  for _, cmd_spec in pairs(doom.cmds) do
    utils.make_cmd(cmd_spec[1], cmd_spec[2])
  end

  -- Handle extra user autocmds
  local autocmds = {}
  for _, cmd_spec in pairs(doom.autocmds) do
    table.insert(autocmds, cmd_spec)
  end
  utils.make_augroup("user", autocmds)

  -- User keybinds handled in `nest` module
end

return doom_modules
