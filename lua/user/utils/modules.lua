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

utils_modules.get_module_template_from_name = function(mname)
  return string.format(
    [[
local %s = {}

-- TODO:
--
--    -

-- %s.settings = {}

-- %s.packages = {
-- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- -- [""] = {},
-- }

-- %s.cmds = {}
-- %s.autocmds = {}
-- %s.binds = {}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(%s.binds, {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "YYY",
--         name = "+ZZZ",
--         {
--         -- first level
--         },
--       },
--     },
--   })
-- end

return %s
  ]],
    mname,
    mname,
    mname,
    mname,
    mname,
    mname,
    mname,
    mname
  )
end

return utils_modules
