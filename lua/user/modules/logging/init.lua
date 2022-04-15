local logging = {}

logging.packages = {
  -- does vlog nvim already exist in core?!
  -- ["vlog.nvim"] = {"tjdevries/vlog.nvim"}, -- Single file, no dependency, easy copy & paste log file to add to your Neovim Lua plugins.
}

logging.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  table.insert(logging.binds, {
    "<leader>",
    name = "+prefix",
    {
      {
        "t",
        name = "+tweak",
        {
          "l",
          name = "logging",
          {
            { "t", [[:lua doom.logging = "trace"<CR>]], name = "set logging trace" },
            { "d", [[:lua doom.logging = "debug"<CR>]], name = "set logging debug" },
            { "i", [[:lua doom.logging = "info"<CR>]], name = "set logging info" },
            { "w", [[:lua doom.logging = "warn"<CR>]], name = "set logging warn" },
            { "e", [[:lua doom.logging = "error"<CR>]], name = "set logging error" },
            { "f", [[:lua doom.logging = "fatal"<CR>]], name = "set logging fatal" },
          },
        },
      },
    },
  })
end

return logging
