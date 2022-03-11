local utils = require("doom.utils")
local filename = "settings.lua"

-- Path cases:
--   1. stdpath('config')/../doom-nvim/modules.lua
--   2. stdpath('config')/modules.lua
--   3. <runtimepath>/doom-nvim/modules.lua
local settings = dofile(utils.find_config(filename))

return settings

