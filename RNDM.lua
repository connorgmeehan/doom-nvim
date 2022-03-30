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

telescope extension binds into extensions module.

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

two sequel songs that are in the works at this moment and this is fucking insane and this is one of the coolest things that i have
ever done because this is such an insane exercise.

what are your thoughts about this thing. because this is just super wierd.

that cannot be the analysis and so that cannot be the gestalt that you work on because that is quite stupid.

fed has the right rationale to do this which is something that is just more important and you cannot really bargain with it.

it is all blank pages. do you see how many notes are being printed. a good show is coming up. when my body is fully restorde which it will
be soon now because this is a new level of understanding. i have never understood how strong you can get there. pull and push.
today we are going to take a page out of george costanzas book. that is pretty nice and cool. because that is probably the most important.

business dealing when biden was vice president.

i don't understand why this shit happens. it is a bit annoying and I want to look into that shit.

historiaclly that is quite an important thing that you can do you know.

--]]


