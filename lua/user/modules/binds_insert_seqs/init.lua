local M = {}

-- local user_utils = require("user.utils")
-- bind = user_utils.insert_binds_into_main_table

-- insert sequences
M.binds = {
    -- { "i", "zm", "<ESC>:w<cr>", opts_s, "Editor", "exit_insert", "Exit insert mode" },
  -- { "i", "zt", "<ESC>cT", opts_s, "Editor", "exit_insert_till_bkw", "Exit insert mode and change Until Backwards" },
  -- { "i", "zD", "<ESC>dF", opts_s, "Editor", "exit_insert_delete_bkw", "Exit insert mode and delete Backwards" },
  -- { "i", "zh", "<ESC>yF", opts_s, "Editor", "exit_insert_yank_bkw", "Exit insert mode and yank Backwards" },
    { "zf", "<ESC>cF", mode = "i", name = "esc search back", options = { silent = true } },
    {
      "zp",
      "<ESC>la",
      mode = "i",
      options = { silent = true },
      name = "Exit Insert Mode and append right",
    },
    {
      "zP",
      "<ESC>A ",
      mode = "i",
      options = { silent = true },
      name = "Exit Insert Mode and (A)ppend",
  },
}

return M
