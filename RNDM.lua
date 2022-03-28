--[[

- 1. need to turn off gpg
- 2.

what possibilities are there.

- disable fully
- cronjo
- solve bug
- ask dannymat if he uses neogit.


---------------------------------------------------------

Yeah go for it, if you wanted you could copy the lua/doom/modules/features/lsp
to lua/user/modules/lsp and make any changes you want there.  I'm pretty sure
everything will work.

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

i am so tired now that it is fucking insane. i don't understand how this
is possible. it fucking hit me. that is how fucking milfs fuck.

they can free themselves from ukrain and areas surrounding that place. which is fucking levelled to the ground. it is quite horrific.



--]]
