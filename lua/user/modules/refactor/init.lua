local refactor = {}

-- https://github.com/ThePrimeagen/refactoring.nvim -- <<<<<<<<<<<< https://martinfowler.com/books/refactoring.html
-- https://github.com/clojure-vim/clj-refactor.nvim

refactor.packages = {
  -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
  ["refactoring.nvim"] = {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}

refactor.configs = {}
refactor.configs["refactoring.nvim"] = function()
  require("refactoring").setup({})
end
-- require('refactoring').setup({
--     -- prompt for return type
--     prompt_func_return_type = {
--         go = true,
--         cpp = true,
--         c = true,
--         java = true,
--     },
--     -- prompt for function parameters
--     prompt_func_param_type = {
--         go = true,
--         cpp = true,
--         c = true,
--         java = true,
--     },
-- })

-- refactor.binds = {}
-- if require("doom.utils").is_module_enabled("whichkey") then
--   table.insert(refactor.binds, {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "w",
--         name = "+windows",
--         {
--           { "z", [[<esc><cmd>suspend<CR>]], name = "suspend vim" },
--         },
--       },
--     },
--   })
-- end


-- -- Remaps for each of the four refactoring operations currently offered by the plugin
-- vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
-- vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
-- vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
-- vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
-- -- Inline variable can also pick up the identifier currently under the cursor without visual mode
-- vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- -- prompt for a refactor to apply when the remap is triggered
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>rr",
--     ":lua require('refactoring').select_refactor()<CR>",
--     { noremap = true, silent = true, expr = false }
-- )

-- -- load refactoring Telescope extension
-- require("telescope").load_extension("refactoring")
-- -- remap to open the Telescope refactoring menu in visual mode
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>rr",
-- 	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
-- 	{ noremap = true }
-- )

return refactor
