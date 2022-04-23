local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled

local utils_path = {}


-- TODO: redo this with plenary.path
utils_path.path_get_tail = function(p)
  local tail = vim.tbl_map(function(s)
    return s:match("/([_%w]-)$") -- capture only dirname
  end, p)
  return tail
end

utils_path.get_dir_files_or_both_in_path_location = function(path)
  local scan_dir = require("plenary.scandir").scan_dir
  local scan_dir_opts = { search_pattern = ".", depth = 1, only_dirs = true }
  local t_current_module_paths = scan_dir(path, scan_dir_opts)
  return t_current_module_paths
end



return utils_path

