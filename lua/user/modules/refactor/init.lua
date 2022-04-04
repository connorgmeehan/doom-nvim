local refactor = {}

-- https://github.com/ThePrimeagen/refactoring.nvim -- <<<<<<<<<<<< https://martinfowler.com/books/refactoring.html
-- https://github.com/clojure-vim/clj-refactor.nvim

refactor.packages = {
  ["refactoring.nvim"] = { "ThePrimeagen/refactoring.nvim" },
}

refactor.configs = {}
refactor.configs["refactoring.nvim"] = function()
  require("refactoring").setup({})
end

return refactor
