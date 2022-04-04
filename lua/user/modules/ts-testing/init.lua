local ts_testing = {}

ts_testing.settings = {}

-- TODO:
--
-- >>> COPY PASTE EXAMPLES FROM NVIM-TREESITTER. <<<<
--
-- in the same way as I copied nui examples.
-- so that I can get started fast. then it should be much more easy to do this.
--
--
-- >> https://github.com/nvim-treesitter/nvim-treesitter#available-modules
-- >> :h nvim-treesitter

-- Can refactor take the functions below and hoist them to local functions at
-- the beginning of the file?
ts_testing.cmds = {
  { "TSTestPrint", ':lua print("hello")' },
  {
    "TSTestLog",
    function()
      -- use nui to create a popup that prints treesitter info about a buffer.
      -- number of children.
      -- names etc.
    end,
  },
  {
    "TSTestPrintContext",
    function()
      print("ts-testing -> ")
      local parser = vim.treesitter.get_parser(0)
      local tstree = parser:parse()
      tstree:root()
      print(vim.inspect(tstree))
    end,
  },
  {
    "TSTestingVisualSelectScope",
    function()
      -- ??
      -- nui menu > select what to highlight.
    end,
  },
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
