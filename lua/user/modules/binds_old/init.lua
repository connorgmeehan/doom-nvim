-----------------------------
---       READ FILE       ---
-----------------------------

-- -- navigation + rm arrows
-- {'i', '<Down>', '<Nop>' },
-- {'i', '<Left>', '<Nop>' },
-- {'i', '<Right>', '<Nop>' },
-- {'i', '<Up>', '<Nop>' },
-- {'n', '<Down>', '<Nop>' },
-- {'n', '<Left>', '<Nop>' },
-- {'n', '<Right>', '<Nop>' },
-- {'n', '<Up>', '<Nop>' },
-- {'v', '<Down>', '<Nop>' },
-- {'v', '<Left>', '<Nop>' },
-- {'v', '<Right>', '<Nop>' },
-- {'v', '<Up>', '<Nop>' },

-- -- ctrl move
-- {'i','<c-l>','<space>'},
-- {'c','<c-l>','<space>'},

------------------------------
---       formatting       ---
------------------------------

-- { "n", "<leader>ai", "mzgg=G`z<cr>", opts.s, "Format", "indent_file", "Indent File" },
-- { "n", "<leader>au", "viwUe", opts.s, "Format", "upper_case", "Word Upper" },
-- { "n", "<leader>aU", "viwue", opts.s, "Format", "lower_case", "Word Lower" },

----------------------------------
---       todo quicklist       ---
----------------------------------

-- { 'n', '<leader>Tq', '<cmd>TodoQuickFix<cr>',  {}, "Quick Fix", "todo_quick_fix", "Todo Quick Fix" },
-- { 'n', '<leader>Tt', '<cmd>TodoTrouble<cr>',   {}, "Trouble",   "todo_trouble", "Todo Trouble" },
-- { 'n', '<leader>Te', '<cmd>TodoTelescope<cr>', {}, "Telescope", "todo_telescope", "Todo Telescope" },
-- { 'n', '<leader>Tl', '<cmd>TodoLocList<cr>',   {}, "LocList",   "todo_loc_list", "Todo LocList" },

-----------------------
---       GIT       ---
-----------------------

-- TODO:
--
--  git reset
--	unstage all
--
--	split hunk ???????????????????????
--
--	reset hunk
--	reset buffer
--	reset hunk
--
--	partial hunks // https://github.com/lewis6991/gitsigns.nvim/pull/411

-- WHICH-KEY TREE
-- ["l"] = {
--   name = "+git-test",
--   ["zo"] = { "open lazygit" },
-- },

-- -- 1. unstage all
-- { 'n', '<leader>lgr', '<cmd>!git reset<cr>', opts.s },
-- -- 2. unstage all and stagu hunk under cursor
-- -- 3. triple -> unstage all, select at cursor, and commit
-- -- 4. unstage all and commit only current buffer.

-- -- NEOGIT
-- -- :Neogit " uses tab
-- -- :Neogit kind=<kind> " override kind
-- -- :Neogit cwd=<cwd> " override cwd
-- -- :Neogit commit" open commit popup
-- -- { 'n', '<leader>lnh', '<cmd>lua require("neogit").open({ kind = "vsplit", cwd = "~" })<CR>', opts.s},
-- { 'n', '<leader>lj', '<cmd>Neogit<CR>', opts.s},
-- { 'n', '<leader>lnc', '<cmd>Neogit commit<CR>', opts.s},
-- { 'n', '<leader>lnl', '<cmd>Neogit pull<CR>', opts.s}, -- TODO: pull
-- { 'n', '<leader>lnp', '<cmd>Neogit push<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lnb', '<cmd>Neogit branch<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lnv', '<cmd>Neogit log<CR>', opts.s}, -- TODO: push
-- { 'n', '<leader>lns', '<cmd>Neogit stash<CR>', opts.s}, -- TODO: push

-- -- -- GITSIGNS
-- { 'n', '<leader>lsn', '<cmd>lua require("gitsigns").next_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsp', '<cmd>lua require("gitsigns").prev_hunk()<CR>', opts.s},
-- { 'n', '<leader>lss', '<cmd>lua require("gitsigns").stage_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsu', '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', opts.s},
-- { 'n', '<leader>lsb', '<cmd>lua require("gitsigns").stage_buffer()<CR>', opts.s},
-- -- TODO: diffthiss > diffview hunk at cursor
-- -- -- TODO: undo buffer
-- -- toggle_signs()
-- -- 	toggle_numhl()
-- -- 	toggle_linehl()
-- -- 	toggle_word_diff()
-- -- 	toggle_current_line_blame()
-- -- 	refresh()

-- -- -- DIFFVIEW
-- { 'n', '<leader>ldh', '<cmd>DiffviewOpen<CR>', opts.s},
-- { 'n', '<leader>ldc', '<cmd>DiffviewClose<CR>', opts.s},
-- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s},
-- -- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s}, -- TODO: prev commit
-- -- { 'n', '<leader>ldH', '<cmd>DiffviewOpen HEAD~2<CR>', opts.s}, -- TODO: HEAD prev HEAD

-- -- -- VGIT
-- { 'n', '<leader>lvb', '<cmd>lua require("vgit").buffer_hunk_preview()<CR>', opts.s},
-- { 'n', '<leader>lV', '<cmd>vgit<CR>', opts.s},

-- -- -- LAZYGIT
-- -- mappings.map("n", "<leader>go", "<cmd>LazyGit<CR>", opts, "Git", "lazygit", "Open LazyGit")
-- { 'n', '<leader>lzo', '<cmd>LazyGit<CR>', opts.s},

-- local bind = function(t)
--   print(t[1], t[2])
--   -- enabled?
--   if t[1] then
--     for key, mappings in pairs(t) do
--       print("type: ", type(key), key)
--       if type(key) ~= "number" then
--         print(key, "<<<<")
--         table.insert(doom.binds, mappings)
--       end
--     end
--   end
-- end

