--[[

- 1. need to turn off gpg
- 2.

wha possibilities are there.

- disable fully
- cronjo
- solve bug
- ask dannymat if he uses neogit.


---------------------------------------------------------

>>> OVERRIDE CMP <<<

Yeah go for it, if you wanted you could copy the lua/doom/modules/features/lsp
to lua/user/modules/lsp and make any changes you want there.  I'm pretty sure
everything will work.

TODO: try this and just duplicate the lsp module.

OR try this according to docs:

```lua
--- config.lua

local lsp = doom.modules.lsp
local old_nvim_cmp_config_function = lsp.configs['nvim-cmp']
lsp.configs['nvim-cmp'] = function()
  old_nvim_cmp_config_function() -- Run the default config
  local cmp = require("cmp") -- direct access to plugin
end
```

---------------------------------------------------------

create helper that adds appropriate package keys.


add_package
add_telescope_extension

---------------------------------------------------------

everything should move into modules. modules should be self-contained. so that you know you are treating everything that it
within the subject in this specific module so that it is easy to manage them.
this is nice and it also makes. i know you were big into it back in the days but now i haven't heard much about it in a while.

rename lightspeed to motion. this is quite fucking nice because it gives you more motions.


this is pretty cool because this allows for such nice containment of all plugins and I love this because this is just
the thing that I need.

--]]


