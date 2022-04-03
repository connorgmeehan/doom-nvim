local ts_testing = {}

ts_testing.settings = {
}

ts_testing.cmds = {
  {
    "TSTestingPrintContext",
    function()
      print("ts-testing -> ")
    end,
  },
  -- {
  --   "",
  --   function()
  --   end,
  -- }, -- BindsCreateGetInput
}

-- if require("doom.utils").is_module_enabled("whichkey") then
--   ts_testing.binds = {
--     {
--       "<leader>M",
--       name = "+moll",
--       {
--         { "i", "<cmd>:BindsCreateGetInput<CR>", name = "creab binds test input" },
--         { "I", "<cmd>:MiniSyntaxTest<CR>", name = "create binds syntax test" },
--       },
--     },
--   }
-- end

return ts_testing

