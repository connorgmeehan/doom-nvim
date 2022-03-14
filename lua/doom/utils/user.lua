local utils = require("doom.utils")
local is_plugin_disabled = utils.is_plugin_disabled

local user = {}

-- @param: t
user.add_or_override_plugin = function(t)
  local user, name = string.match(t[1], "(.*)/(.*)")
  local repo = t[1]
  local local_prefix = t[2]

  -- check if plugin already exists
  if doom.packages[name] == nil then
    doom.packages[name] = {}
  end

  -- prefend repo with local path
  if t[2] ~= nil then
    repo = local_prefix .. repo
  end

  -- override the repo name / if local will the be used
  doom.packages[name][1] = repo

  for k, value in pairs(t) do
    if type(k) ~= "number" then
        doom.packages[name][k] = value
    end
  end
end

-- build nest map tree recursive
function build_nest_tree(user_tree)
  local t_nest = {}
  for key, user_node in pairs(user_tree) do
    if type(key) == "number" then
      table.insert(t_nest, user_node) -- << LEAF
    elseif type(key) == "string" then
      local new_branch = {
        string.format("%s", key:sub(1,1)),
        name = string.format("+%s", key:sub(3)),
        build_nest_tree(user_node)
      }
      table.insert(t_nest, new_branch) -- insert branch
    end
  end
  return t_nest
end

-- bool enable/dissable
-- mode keyword add to all binds if it doesn't exist
-- mappings table or key.
user.insert_binds_into_main_table = function(t)
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


return user
