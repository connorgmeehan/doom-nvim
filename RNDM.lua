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

this is getting quite insane now and with this new modular strategy you can pretty much achieve anything in the core and it is easy
to maintain because everything is.

this is quite fucking annoying. this is just so fucking insane and this relives my body of the pain that is there all the time.

hmmm so this is a bit wierd but I am starting to understand I believe so this will actually go my way in the end I think but I am not a hundred
percent sure right now. this is a quite insane exercise and so that is something that we don't want to look into at all and you cannot
really understand how strong that force is. I cannot really see now because i have had that light going into my eyes for so long
now that i cannot see shit of what I am writing which is quite fucking insane and that is not very nice at all. you know and I would
like to check it out if it was possible.

okay so that is quite nice because now i can see that it is empty which means that there is something that is wrong about it.
how does it feel now to type at the computer i don't know actually because this is such a difference in my system that it feels quite fucking
retarded and one of the things that I really don't like about this is that I don' understand how to get the fuck out of this shit which
is something thaty ou might never get if you are one of those people that cannot really try to do that shit.

not anymore. and so that is something that I really don't want to look into. i have had it and now I don't have it anymore.

whether we like it or not we are going to be subject to a insurgency so that is going to come in a couple of weeks I would assume.
or I am assuming so that is quite fucking important andd that is not very nice at all since this is fucking shitty as fuck.

you were suppose to upload your grades so that is quite fucking retarded and so that is something that I donfmt understand how that
would work so one thing that is much more performant is to use it inside of vim.

universities and highschool council which is quite a nice system but that is not the thing that I need because I need to input a four
digit code that they did mail me so I cannot get this code for now but this is quite fucking stupid and that is something that you might do
and so that is something that they could do so one of those things felt quite annoying and shitty.

you have to have some kind of retardation in order to think that is normal behavior.

so now this is. this is the beginning of a new era in my life where i undersand completely how to navigate insanely fast with this
system so that you can make things insanely fast

next step is just to become superstrong in my body like this and that is going to be quite fucking intreesting and this is the thing
that is the most necessary that I could ever have dreamt of.

around the twenty fourth and so this is quite fucking strange and this is insane this is actually quite franly fucking insane.
and i believe now that this is the thing that i should have done always and so that is something that is quite fucking stupid.

since that is so fucking dangerous that is one of the smartest things that I have ever done which is quite fucki insane and you have
to be faster and much much more faster. because it is a lot of fun and that is something that is quite fucking insane and you can
type so fast that it is just fucing insane.

they have a lot of respect for these ones and that is quite stupid. they never say anything of substance.
bring down people who are fraudsters. and completely rely on external parties which is quite fucking insane and that is good.

we would have doubled in population then that would never have picked up on the last line which is quite fucking insane and i don't
understand why this is so that is something that they have to check out in the end but why do you do that i am asking myself nothing
about the ethical niveau. milieu

this is quite nice actually because now everything is kept in lua with this interface which is something that is quite fucking nice.

this is wierd because i don't understand. how that cannot take effect. so now the next step is to understand how you assign

new binds so that I don't overwrite them which would suck.

so now i am going to do a puff and then do some more hip flexor movements.

now this is getting more and more clear so this is good because this will make neovim into a great developmen environment but
it is insanely hard to get started with it because there is just so little given and the docs are a pain in the ass and i don't understand
how that shit would fukcing work in the real world.

tyler the creators dick hole so that is a quite advanced system that doesn't really fucking bring it up is that how you do it.

if I can do that then this is something that I would really like to be able to do you know.

--]]
