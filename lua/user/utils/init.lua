local utils = require("doom.utils")
local is_module_enabled = utils.is_module_enabled

local user_utils = {}

--[[

in this file I can play around with and test utility functions that can then later be moved into core. so that the process
of developing is more separated so that it is easy to maintain.
--]]

user_utils.create_new_module = function()
  -- user input for modulea name
  -- create dir
  -- create init file
  -- open file and insert luasnip template.
end


user_utils.paths = {
  ghq = {
    github = "~/code/repos/github.com/",
  },
}

-- make sure plugin is loaded after telescope
user_utils.after_telescope = function()
  return is_module_enabled("telescope") and "telescope" or nil
end

-- load telescope extension
user_utils.load_extension_helper = function(ext_key)
  return function()
    if utils.is_module_enabled("telescope") then
      require("telescope").load_extension(ext_key)
    end
  end
end

-- add_plugin
user_utils.add_plugin = function(spec) end
-- add_tele_ext
user_utils.add_tele_ext = function(spec) end

-- @param: t
user_utils.add_or_override_plugin = function(t)
  local user, name = string.match(t[1], "(.*)/(.*)")
  local repo = t[1]
  local local_prefix = t[2]

  -- check if plugin already exists
  if doom.uses[name] == nil then
    doom.uses[name] = {}
  end

  -- prefend repo with local path
  if t[2] ~= nil then
    repo = local_prefix .. repo
  end

  -- override the repo name / if local will the be used
  doom.uses[name][1] = repo

  for k, value in pairs(t) do
    if type(k) ~= "number" then
      doom.uses[name][k] = value
    end
  end
end

-- build nest map tree recursive
local function build_nest_tree(user_tree)
  local t_nest = {}
  for key, user_node in pairs(user_tree) do
    if type(key) == "number" then
      table.insert(t_nest, user_node) -- << LEAF
    elseif type(key) == "string" then
      local new_branch = {
        string.format("%s", key:sub(1, 1)),
        name = string.format("+%s", key:sub(3)),
        build_nest_tree(user_node),
      }
      table.insert(t_nest, new_branch) -- insert branch
    end
  end
  return t_nest
end

-- bool enable/dissable
-- mode keyword add to all binds if it doesn't exist
-- mappings table or key.
user_utils.insert_binds_into_main_table = function(t)
  local enabled = t[1]
  if enabled then
    local map_tree
    for k, v in pairs(t) do
      if type(k) ~= "number" then
        map_tree = v
        table.insert(doom.binds, map_tree)

        -- if t[2]

        -- if key = table -> normal ??

        -- visual

        -- select

        -- x

        -- terminal

        -- command

        -- -- leader
        -- if k == "leader" then
        --   if not is_plugin_disabled("whichkey") then
        --     table.insert(doom.binds, {
        --       "<leader>",
        --       name = "+prefix",
        --       build_nest_tree(map_tree)
        --     })
        --   end
        -- end
      end
    end
  end
end

return user_utils
