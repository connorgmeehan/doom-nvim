local diagrams = {}

diagrams.settings = {}

diagrams.packages = {
  ["venn.nvim"] = { "jbyuki/venn.nvim" },
  -- ["vim-slumlord"] = {"scrooloose/vim-slumlord "}, -- seems pretty cool.
}

diagrams.config = {}
diagrams.config["venn.nvim"] = function()
  -- local mappings = require("doom.utils.mappings")

  -- FIX: not getting this to work
  function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
      vim.b.venn_enabled = true
      vim.cmd([[setlocal ve=all]])
      -- draw a line on HJKL keystokes
      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
      -- draw a box by pressing "f" with visual selection
      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
    else
      vim.cmd([[setlocal ve=]])
      vim.cmd([[mapclear <buffer>]])
      vim.b.venn_enabled = nil
    end
  end

  -- mappings.map('n', '<leader>D', "<cmd>lua Toggle_venn()<CR>", { noremap = true }, "Editor", "venn_toggle", "Toggle Venn")
end

return diagrams
