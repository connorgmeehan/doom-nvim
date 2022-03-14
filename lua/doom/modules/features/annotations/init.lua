local annotations = {}

annotations.settings = {
  enabled = true,
  languages = {
    lua = {
      template = {
        annotation_convention = "ldoc",
      },
    },
  },
}

annotations.packages = {
  ["neogen"] = {
    "danymat/neogen",
    commit = "b7d2ce8c1d17a0b90f557e5f94372f42193291a5",
    after = "nvim-treesitter",
  },
}

annotations.configure_functions = {}
annotations.configure_functions["neogen"] = function()
  require("neogen").setup(doom.modules.annotations.settings)
end

return annotations
