local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled

local utils_modules = {}

-- @param str | table -> list of module categories
utils_modules.get_modules = function(requested_modules)
  local modules_result = {}
  -- if requested_modules == string
  -- 	user ->
  -- 	core -> ?
  --
  -- else table
  -- end

  return modules_result
end

utils_modules.create_new_module = function()
  --
end

utils_modules.get_modules_template = function(mname)
  local str_tempate = ""

  return str_tempate
end

return utils_modules
