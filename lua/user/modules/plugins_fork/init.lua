local pf = {}

local function fork_plugin_under_cursor()
  -- 1. tree sitter > get string under cursor
  -- 2. filter string > only repo string
  -- 3. use ghm to clone the repo
  -- 4. prepend the local path to the packer spec.
  -- 5. reload doom
  -- 6. install plugin.
end

-- pf.binds = {}

return pf
