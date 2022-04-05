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

how do you guys think about thisr/ so how good will this feel today that I have broken out of that shit and so that is something that is
not really fucki crazy. we will see that later but hopefully this will get really good and the system is quite nice.

the master of the disaster is the one who goes into the underbelly and brings that shit out so that anyone who wants can see that shit and
then jump around from it.

the luga lab is a bit more sinister and so that is quite fucking insane so that you can do this shit and really make it into something
that is quite fucking cool you know dude.

this is a bit fucking annoying you know dude.

crefactor.nvian you tell us that he has every opportunity to do that shit.

uncarted territory. which is quite fucking insane. some of the hardest hit in the country which is annoying as fuck.

with local orders to stay at home which is quite annoying and important and so the first thing is how the fuck do you get covid?

anders tegnell with experience with fighting ebola in the africans so that is a quite interesting and that is avery good manner.
he is a shitty motherfucker and this sounds a bit like a mad mans functionality and king carl gustav as he urged swedes to
cancel their usual get aways to swedish cabins.

be edited and the federal government is distributing this shit

how does typing feel now that I am starting to get out of it completely which is somethi that is insaenlarstoars.
and so this is going to be so fucking cool and the thing that is so nice about this is that the thing that they'll will be doing
is something that is quite fucking retraded and you might never understand if that is something that yu mgarstharsoi
so what the fuck is theat thing thatymgith never need oarsarstarst

start letting the lsp do everithing and remove all possible errors that occur in those windows.

this is the most importnat

is the reason why the did that shit and that is pretty fucking strange.

they should be ashamed of themselves for applauding him when he was clapping. so that is fucking retarded and that is the lisa
simmers song.

since you already know it is comming. so in everything in my life I have no regrets and this is the biggest gift that I have ever had
in my life so this is quite fucking insane and the reason why this is is because there is something that you cannot really do but
it i also quite fucking strange. am I still making this good enough.

you pared in a loading zone or something . thanks brother. pacco paco pako.

this is pretty amazing and now I can really feel how everithingis opening up and this is a super important moment in my life
because now ti is starting to open up and it feels really wierd and funny.

there are not many people who think that is a reasonable thing to do so that is why they would never fucking make it into something
that fast you know.

it is that he is forced to give up some areas of ukrain.

the cat is already dead because it fell of the roof. that would be pretty cool you know.

so that is not very professional ideas it sounds a bit funny but then it actually works out very nicely in the end


this is a bit annoying because I donfmt understand how to get the fuck out of this shit so that I can become completely free which would
be the absolute goal in thime you know motherfucker bitch as

this is just so fucking insane that you might never be able to tell him what the fuck that could be which is nothign that is like that you know.

look at nvim treehopper to learn how treesitter can be used and move it into a module of my own for doom.binds
and make my own command with it.

--]]
