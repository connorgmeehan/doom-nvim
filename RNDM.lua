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

biscops arne.

--]]
