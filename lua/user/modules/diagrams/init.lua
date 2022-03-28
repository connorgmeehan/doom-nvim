local diagrams = {}

diagrams.settings = {}

diagrams.packages = {
  ["venn.nvim"] = { "jbyuki/venn.nvim", config = require("molleweide.configs.venn") },
  ["nabla.nvim"] = { "jbyuki/nabla.nvim" }, -- , config = require("molleweide.configs.nabla")
  ["quickmath.nvim"] = { "jbyuki/quickmath.nvim" }, -- calculator
}

return diagrams

