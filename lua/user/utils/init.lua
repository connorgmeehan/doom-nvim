local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled

local user_utils = {}

user_utils.paths = {
  ghq = {
    github = "~/code/repos/github.com/",
  },
}

user_utils.after_telescope = function()
  return is_module_enabled("telescope") and "telescope" or nil
end

user_utils.load_extension_helper = function(ext_key)
  return function()
    if utils.is_module_enabled("telescope") then
      require("telescope").load_extension(ext_key)
    end
  end
end

user_utils.add_spec = function(spec) end
-- insert after telescope attr
user_utils.add_tele_ext = function(spec) end


return user_utils
