local create_module = {}


-- 1. input > ask for module name
-- 2. if name does not exist > scandir compare to input name
-- 3. then create module.
-- 4. tree sitter analyse that the module has all of the necessary parts.
-- 5. -> create (settings,packages,cmds,autocmds,binds)

create_module.cmds = {
  {
    "DoomMakeModuleCore",
    function()

      -- TODO:
      --
      --

      -- 1. get list / table of existing module names.
      -- 2. get user input
      -- 3. does input exist?
      -- 4. create dir
      -- 5. create init.lua
      -- 6. open file into buffer
      -- 7. insert template for module.
      -- 8. open the module file in a split window
      -- 9. use telescope to filter input to see if it exists.
      -- 10. if select already existing module > open that module file in split
      -- 11. if it does not exist > create new module.
    end,
  },
  {
    "CreateModuleMoveChunkToModule",
    function()
      -- move selected chunk to another module
      -- helper to make it more easy to organize modules and plugins.
      -- use tree-sitter to analyse which components of a file that should be moved.
      -- use REFACTOR.NVIM?
    end,
  },
}

return create_module
