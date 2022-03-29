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

a reaction video is something that they don't understand at all so that is something that is quite fucking retarded and you don't understand
why this is. it is important to try to see how one is being percieved from the outside. uppleva naogonting traces of humour.
i take the friday night for this. do you know how large events that we were forced to say no to.
they made fun of a power person who cries crocodile tears. what do you mean when you say that. well I am not telling them.
he is just so funny. he is old and senile and makes so many awesome blunders. brain dain.

this is just so much fun. you know then they will know the response. i think that he is just so fucking funny. i don't have a problem
with this actually. he is fucking hilarious. hunters arts assesor is going to asses this shit so that it is something that you cannot
really do. the regime. this is quite insane because this creates a completely new exercise that i have never done before. so this is
something that you have to do.

that twitter is something that is fucking disgusting. everything by the gay rights happened and that is a bit insane actually.

--]]


