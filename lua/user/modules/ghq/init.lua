local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled
local user_util = require("user.utils")

after_telescope = user_util.after_telescope
load_extension_helper = user_util.load_extension_helper

local ghq = {}

ghq.settings = {}

ghq.packages = {
  ["telescope-ghq.nvim"] = { "nvim-telescope/telescope-ghq.nvim" },
}
for _, ext in ipairs(ghq.packages) do
  ext["after"] = after_telescope
end

ghq.configs = {}
ghq.configs["telescope-ghq.nvim"] = load_extension_helper("ghq")

return ghq
