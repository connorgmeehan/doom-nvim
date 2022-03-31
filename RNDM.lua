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

see if it is possible to keep all operator changing mappings in one module and then see if it works.
otherwise it has to be done "first" but first see if that is even necessary.

------------------------------------------

what are all options defaults? possibilities?

ask connor does nest use nvim-mapper to create the binds or is this done in nvim-mapper?

look at the mapping util.

------------------------------------------
that is something that is quite fucking similar. to russia so that is something that is a bit similar on the surface. aaah.

it is not a chronological story. instead it is divided inte sections that deal with themes. and that is why the timeline is
scattered so to speak. the council for stage play and culture. that stops culture news for today more ners can be found in the
app swedish ratio play in your app store. equality council. sixtythree sais that they've had their personal codes removed from
the state databases which means that they cannot do anything. molly sanden storre has gotten the goal to create the EM song.
is that like somekind of europeean thing or is it a swedish song? i mean intended for a swedish market?
anders ygeman. klippa och klistra i generna foer att goera saodanna jjer.

in a couple of months they are counting on them becoming self sufficient. in about twenty states which makes them into something that
is quite wierd and retarded that shaocat gonna have a nice life here in the US and A. the more we support their parents the better
of they'll be in life for later. how easy and comfy we should be able to mix peoples DNA.

in southkorea one man has said that you can disable that gene and make it impossible for you to get sharlatanes.
charlatanes. that they make up for these kinds of things that aren't really the truth. in somekind of legal shenannigans.
a and b league. worried that they won't keep what they have promised. so this is a bit scary actually. we want nothing else but get
home to our own homes and cities. i have put up a lot which means that I cannot really do it you know. you know but that is a paint
to write you know. i am however, a mother of three children.

i can make a hip flexor puller if I connect cables that are low. that is a very interesting thing that I am going to try later when
the lights have gone out a little bit more. welcome and listen so that we can try this shit.

today they are much fewer so that is very interesting. how come that kind of murder have gone down or been reduced in frequency.
so then most of the people were alcoholics but now most are narcotics people whilst alcoholics have gone down a lot.
in order to be able to offer an as good service as possible. no it is nowhere near enough. far off but there just isn't much we can
do toremove the majority of these situations. in most cases we have to just come and fix it.

in the beginning they promised to pull back which is something that they haven't agrred to. where the binds are located shoudn't matter.
so it is stupid to use too many variables and short shit because it only makes things annoying to maintain.

--]]
