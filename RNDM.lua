--[[

- 1. need to turn off gpg
- 2.

what possibilities are there.

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

the question is if I should move all of my functions to other modules.
That should work I belive and test and see how one can maintain user functions.

I know you can attach them to doom in config.lua but can you move these under
user modules somehow?

---------------------------------------------------------

i believe that it is easier to maintain and that is very interesting and just standing like that is very interesting because
over time you will get more and more flexible and these are the only exercises that you want to do. and you can do these
against a bed.

so that is quite interesting. the lsp thing is very interesting and so if the name already exists then you just uncomment
the user module and then it will override that module.

this is much easier to maintain.

and try to suggest a clip to jay he is going to go fucking crazy which is quite fucing insane. this is quite fucking nice and it
really makes the config work well as a motherfucker.

i am not wearing the and they fit so bad that it makes me very mad.
snap diddely doo that could be something to do you know so that we can do this fast as fuck you know. but on the
other hand that would be quite fucking nice.

--]]
