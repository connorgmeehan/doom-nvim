local utils = require("doom.utils")
local use_floating_win_packer = doom.use_floating_win_packer
local log = require("doom.utils.logging")
local system = require("doom.core.system")
local enabled_modules = require("doom.core.config.modules").modules

-- Packer Bootstrapping
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  log.info("Bootstrapping packer.nvim, please wait ...")
  vim.fn.system({
    "git",
    "clone",
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

local use = packer.use
packer.reset()

-- Handle the Modules
--
-- how to remove duplicate specs?
-- need to merge specs if they exist
-- i think this is the only way to rid dupl in packer

local all_specs = {}
local module_specs = {}
local user_specs = {}

-- iterate models and flatten specs into module_specs
for module_name, module in pairs(doom.modules) do
  -- Import dependencies with packer from module.packages
  if module.packages then
    for dependency_name, packer_spec in pairs(module.packages) do
      -- Set packer_spec to configure function
      if module.configure_functions and module.configure_functions[dependency_name] then
        packer_spec.config = module.configure_functions[dependency_name]
      end

      -- Set/unset frozen packer dependencies
      packer_spec.commit = doom.freeze_dependencies and packer_spec.commit or nil
      module_specs[dependency_name] = packer_spec
    end
  end

  -- does this have to account for user as well?
  -- Setup package autogroups
  if module.autocommands then
    local autocommands = type(module.autocommands) == 'function' and module.autocommands() or module.autocommands
    utils.make_augroup(module_name, autocommands)
  end
end

-- Merge user
all_specs = vim.tbl_deep_extend("force", module_specs, doom.packages)

-- Initialize all specs
for _, packer_spec in pairs(all_specs) do
  -- Set/unset frozen packer dependencies
  use(packer_spec)
end
