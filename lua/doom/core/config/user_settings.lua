local utils = require("doom.utils")
local filename = "settings.lua"

local M = {}

-- Path cases:
--   1. stdpath('config')/../doom-nvim/settings.lua
--   2. stdpath('config')/settings.lua
--   3. <runtimepath>/doom-nvim/settings.lua
M.source = utils.find_config(filename)
M.settings = dofile(M.source)

return M
