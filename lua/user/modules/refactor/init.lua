local utils = require("doom.utils")

local refactor = {}

refactor.packages = {
  ["refactoring.nvim"] = {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- https://github.com/clojure-vim/clj-refactor.nvim
}

refactor.configs = {}
refactor.configs["refactoring.nvim"] = function()
  require("refactoring").setup({
    -- prompt for return type
    prompt_func_return_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
  })
  if utils.is_module_enabled("telescope") then
    require("telescope").load_extension("refactoring")
  end
end

refactor.binds = {}
if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(refactor.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "n",
        name = "+nnn",
        {
          {
            "r",
            name = "+refactor",
            {
              -- NORMAL: Inline variable can also pick up the identifier currently under the cursor without visual mode
              {
                "i",
                [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                name = "inline var",
                { noremap = true, silent = true, expr = false },
              },
              -- VISUAL: Remaps for each of the four refactoring operations currently offered by the plugin
               {
                 "e",
                 [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                 { noremap = true, silent = true, expr = false },
                name = "extract func",
                 mode = "v",
               },
               {
                 "f",
                 [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
                 { noremap = true, silent = true, expr = false },
                name = "extract func to file",
                 mode = "v",
               },
               {
                 "v",
                 [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                 { noremap = true, silent = true, expr = false },
                name = "extract var",
                 mode = "v",
               },
               {
                 "i",
                 [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                 { noremap = true, silent = true, expr = false },
                name = "inline var",
                 mode = "v",
               },
               { -- prompt for a refactor to apply when the remap is triggered
                 "r",
                 [[ :lua require('refactoring').select_refactor()<CR> ]],
                 { noremap = true, silent = true, expr = false },
                name = "prompt select"
               },
               { -- remap to open the Telescope refactoring menu in visual mode
                 "r",
                 [[ <Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]],
                 { noremap = true },
                name = "open telescope",
                 mode = "v",
               },
            },
          },
        },
      },
    },
  })
end

return refactor
