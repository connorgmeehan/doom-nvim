--[[

- 1. need to turn off gpg
- 2.

wha possibilities are there.

- disable fully
- cronjo
- solve bug
- ask dannymat if he uses neogit.


--------

`git-remotes`

walk through the command

1. test it on ghq
2. does this work with "others" repos
3. do I have to add forks to my own user?
4. fork nest.nvim > add connor remote and make sure his branch is available
5. use the local nest branch.

if this would work with the regular ghq structure and I can  just add
remotes to my own forks when they have been added to my system that would
be ideal. maybe it would be possible to use the save command to
store all remotes in the exporst list that would be the ideal thing in my
case I believe.

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

see if it is possible to keep all operator changing mappings in one module and then see if it works.
otherwise it has to be done "first" but first see if that is even necessary.

------------------------------------------

what are all options defaults? possibilities?

ask connor does nest use nvim-mapper to create the binds or is this done in nvim-mapper?

look at the mapping util.

------------------------------------------

look at simon's recommndations for data analysis plugins and create a module for doom
so that it can easilly be reused again.

------------------------------------------

biscops arne. i don't think that a woman would have written that you know I have thought a lot about this and it is a bit insane
actually and that is not something that we would lKe at all.

women dominate in universities. so that is a bit insane actually. some kind of positive force. so that is something that is a bit
insane you know. they don't want that shit to happen. joakim passikivi how knows what the fuck is going on and if you shoot a
shell on that side then it will not work and that is very nice and as a man you like hearing that than women. some women might
enjoy it more.

he analyses things that people actually have had problems. he is a bit wierd in many ways but in that way he is quite real you know
and therefore he is good and exetricity. that is how litterature works. a lot of women already were writing back then. commercial.

there is an aspect to doing things that are so convenient in vim that it is a bit insane and so that is fucking retarded.

for her sake so that she will think that he is fucking cool and a nice guy.

new york is the country that does this shit so that anyone who can fix these things will never be making them and that is the reason why
they did that shit .

a couple of months ago so that it is a bit easier to fucking do this and I always forget the syntax so that is something that I
don't like at all.

now comes the hook. like that what's that about.

name spaced commands so you cannot accidentally just trigger plugins.
and fuck them so that is quite fucking fast and so that is

i did this guy for years.

this is the random file

TEST COMMAND WITH ARGUMENTS <<<<<<<<<<
HOW IS THIS DONE IN GTD NEORG?

that is a good one so that you can

this is very nice. and so the blockfi blog would be good and another resource is that one which is quite fucking strange.


walk through vhyrro's config and make stuff into modules.



remove duplicate packer spec keys.
even he is doing that which is quite an insane system that is so fast that you cannot even understand it you know and even if this is
something.

--]]
