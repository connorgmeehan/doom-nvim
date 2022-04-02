local paths = {}

paths.packages = {
  ["vim-rooter"] = { "airblade/vim-rooter" },
  -- { 'oberblastmeister/nvim-rooter' },
}


-- {
--     "P", name ="+path", { -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
-- -- - file path to global
-- -- - file git root global nvim
-- -- - active file buffer
-- -- https://stackoverflow.com/questions/38081927/vim-cding-to-git-root
-- { "n", "<leader>fpa", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", options = { silent = true }, "Editor", "cwd_to_active_file", ":cd active file" },
-- { "n", "<leader>fpg", "<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>", options = { silent = true }, "Editor", "cwd_to_current_git_root", ":cd active git root" },
--       -- {
--       -- 	"n",
--       -- 	"<leader>fpa",
--       -- 	"<cmd>cd %:p:h<CR><cmd>pwd<CR>",
--       -- 	options = { silent = true },
--       -- 	"Editor",
--       -- 	"cwd_to_active_file",
--       -- 	":cd active file",
--       -- },
--       -- {
--       -- 	"n",
--       -- 	"<leader>fpg",
--       -- 	"<cmd>cd %:h | cd `git rev-parse --show-toplevel`<CR><cmd>pwd<CR>",
--       -- 	options = { silent = true },
--       -- 	"Editor",
--       -- 	"cwd_to_current_git_root",
--       -- 	":cd active git root",
--       -- },
--     }
--   },

return paths