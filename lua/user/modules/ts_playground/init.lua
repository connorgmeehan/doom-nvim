local ts_playground = {}

ts_playground.settings = {}

ts_playground.packages = {
  ["playground"] = { "nvim-treesitter/playground" }, -- move to ts module.
}

ts_playground.binds = {}

if require("doom.utils").is_module_enabled("whichkey") then
  ts_playground.binds = {
    {
      "<leader>v",
      name = "+testing",
      {
        { "p", "<cmd>TSPlaygroundToggle<CR>", name = "ts test print" },
      },
    },
  }
end

return ts_playground

