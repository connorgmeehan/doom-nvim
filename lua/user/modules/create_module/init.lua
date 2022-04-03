local create_module = {}

create_module.cmd = {
  "CreateModule", function()
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
  end
}

return create_module
