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

user.insert_binds_into_main_table = function(t)
  -- enabled?
  if t[1] then
    for key, mappings in pairs(t) do
      if type(key) ~= "number" then
        table.insert(doom.binds, mappings)

        -- if key = table -> normal ??

        -- visual

        -- select

        -- x

        -- terminal

        -- command

        -- leader
        -- if not is_plugin_disabled("whichkey") then
        -- end

      end
    end
  end
end


return user
