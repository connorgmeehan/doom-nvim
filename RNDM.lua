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

move my binds helper to user/utils. this way I can keep all of my heplers in there.

---------------------------------------------------------
https://github.com/echasnovski/mini.nvim

what is this
------------------------------------------

this is pretty cool. now things are coming together much more nicely. in a line lap and so these ones are insanely fast and it is almost
not even fun to try to explain how fast they are because it feels just so much faster.

times has always been a central part but we cannot know now that this is a different thing you know. that is not a relevant comarison.

much worse than the other guys and this is actually quite insane that these guys have done it.

their runners just will perform better and there is not anything that you can do about it.

a tangent of somekind of corruption that doesn't really belong to the parliament which is something that is quite fucking insanea nd this
is quite fucking insane because I don't understand how this could never see obvious before.

anna you have written about this before and this is quite a stupid suggestion.

so this will ingegrate more and more over time so that you can do this actually. the idea is to move the ground with your knee.
and do this to the rhythm to perfectly balance the tension between glutes and hip flexors.

this is quite fucking important. i dunno. i must have closed it by accident. this is only here for reference so you can cherry pick or
do whatever you want.  i did it for like at least a year and that is so fucking stupid as a woman i am glad that i don't have that.
even not you know. things have to be done in a thoughtful way so that you don't have to redo lost of stuff. this approach aims
to make it higly maintaineable to do this so that you can have very large configs that maintainm ultiple plugins. yes no.
i want you or i want that other thing. let's be honest you smell like garlic and you are not that impressive. i am trying
to stand up for all the short kings that are watching us.

the agreements that go down to athens because they didn't want to do that  so that is not very nice hello mister can he
do that i don't think so you know. because that would be quite fucking stupid you know.

merge from the core module into my user lsp module. so that I can maintain both modules separately and still keep the goodies
that the main crew write.

i have to make sure that my regular bindings work in modules so that I can contain stuff. it doesn't really matter if it is perfectly
as long as I can put it away into a module so that I can start caring about other stuff. over time it will show whether the structure
is good or not but the important thing is to be able to move shit into a module so that it is easy to handle.
then I spec what I want to use in the config.lua file such as the user color scheme that I am using.

this is just so fucking cool and now i am going to do some extra  hip flexor training so that ri ca start living and show my parrents
that i am not worthless. and this is quite fucking nice

--]]
