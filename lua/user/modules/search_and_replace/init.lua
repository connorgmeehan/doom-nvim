local search_and_replace = {}

search_and_replace.packages = {
  -- ["nvim-search-and-replace"] = { "s1n7ax/nvim-search-and-replace" },
  -- ["nvim-spectre"] = {"nvim-pack/nvim-spectre" },
}

search_and_replace.configs = {}

search_and_replace.configs["nvim-spectre"] = function()
  require("spectre").setup({
    color_devicons = true,
    open_cmd = "vnew",
    live_update = false, -- auto excute search again when you write any file in vim
    line_sep_start = "┌-----------------------------------------",
    result_padding = "¦  ",
    line_sep = "└-----------------------------------------",
    highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete",
    },
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "goto current file",
      },
      ["send_to_qf"] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all item to quickfix",
      },
      ["replace_cmd"] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace vim command",
      },
      ["show_option_menu"] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show option",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
      ["change_view_mode"] = {
        map = "<leader>v",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode",
      },
      ["toggle_live_update"] = {
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "update change when vim write file.",
      },
      ["toggle_ignore_case"] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        desc = "toggle ignore case",
      },
      ["toggle_ignore_hidden"] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        desc = "toggle search hidden",
      },
      -- you can put your mapping here it only use normal mode
    },
    find_engine = {
      -- rg is map with finder_cmd
      ["rg"] = {
        cmd = "rg",
        -- default args
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        options = {
          ["ignore-case"] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case",
          },
          ["hidden"] = {
            value = "--hidden",
            desc = "hidden file",
            icon = "[H]",
          },
          -- you can put any rg search option you want here it can toggle with
          -- show_option function
        },
      },
      ["ag"] = {
        cmd = "ag",
        args = {
          "--vimgrep",
          "-s",
        },
        options = {
          ["ignore-case"] = {
            value = "-i",
            icon = "[I]",
            desc = "ignore case",
          },
          ["hidden"] = {
            value = "--hidden",
            desc = "hidden file",
            icon = "[H]",
          },
        },
      },
    },
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = nil,
      },
      options = {
        ["ignore-case"] = {
          value = "--ignore-case",
          icon = "[I]",
          desc = "ignore case",
        },
      },
    },
    default = {
      find = {
        --pick one of item in find_engine
        cmd = "rg",
        options = { "ignore-case" },
      },
      replace = {
        --pick one of item in replace_engine
        cmd = "sed",
      },
    },
    replace_vim_cmd = "cdo",
    is_open_target_win = true, --open file on opener window
    is_insert_mode = false, -- start open panel on is_insert_mode
  })
end

--------------------------------------------
---       SEARCH & REPLACE               ---
--------------------------------------------

-- get v sel
--  https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
-- THESE TWO HAVE THE BEST SUGGESTIONS
-- https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/
-- https://phelipetls.github.io/posts/extending-vim-with-ripgrep/

-- https://www.freecodecamp.org/news/how-to-search-and-replace-across-multiple-files-in-vim/
-- https://stackoverflow.com/questions/37424689/search-and-replace-in-multiple-files-using-vim
-- https://irian.to/blogs/how-to-search-and-replace-string-across-multiple-files-in-vim/
-- https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers
-- https://www.reddit.com/r/vim/comments/n8x2xr/til_find_and_replace_multiple_files_with_and/
-- https://github.com/brooth/far.vim

if require("doom.utils").is_module_enabled("whichkey") then
  search_and_replace.binds = {
    "<leader>",
    name = "+prefix",
    {
      {
        "s",
        name = "+search",
        {
          { "g", [[<cmd>Telescope repo cached_list<CR>]], name = "repos cached" },
          { "G", [[<cmd>Telescope repo list<CR>]], name = "repos build" },
          { "f", [[/\v\c]], name = "text case", options = { silent = false } },
          {
            "r",
            name = "+replace",
            {
              { "l", ":s//g<Left><Left>", name = "line", options = { silent = false } },
              {
                "L",
                '"zyiw:s/<c-r>z//g<Left><Left>',
                name = "line iw",
                options = { silent = false },
              },
              {
                "o",
                '"zyiW:s/<c-r>z//g<Left><Left>',
                name = "line iW",
                options = { silent = false },
              },
              {
                "O",
                '"zyiw:s/\\<<c-r>z\\>//g<Left><Left>',
                name = "line iw solo",
                options = { silent = false },
              },
              { "a", ":%s//g<Left><Left>", name = "file", options = { silent = false } },
              {
                "w",
                '"zyiw:%s/<c-r>z//g<Left><Left>',
                name = "word",
                options = { silent = false },
              },
              --
              -- {
              --    "n",
              --    "<leader>rfs",
              --    "\"zyiw:%s/\\<<c-r>z\\>//g<Left><Left>",
              --    { silent = false },
              --    "Replace Inner (w)ord Solo",
              --    "replace_inner_word_solo",
              --    "Replace (w)ord Solo"
              -- },
              -- {
              --    "n",
              --    "<leader>rfW",
              --    "\"zyiW:%s/<c-r>z//g<Left><Left>",
              --    { silent = false },
              --    "Replace Inner (W)ord",
              --    "replace_inner_word_big",
              --    "Replace (W)ord"
              -- },
            },
          }, -- search > replace
          -- {
          --   "R",
          --   name = "+grep/cdo",
          --   {
          -- -- ripgrep search empty
          -- {
          --    "n",
          --    "<leader>rg",
          --    ":grep ",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },
          -- -- ripgrep search word
          -- {
          --    "n",
          --    "<leader>rw",
          --    "\"zyiw:grep <c-r>z",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },
          -- -- ripgrep search WORD
          -- {
          --    "n",
          --    "<leader>rW",
          --    "\"zyiW:grep <c-r>z",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },

          -- -- TODO: add vimgrep variants
          -- -- vimgrep search empty
          -- {
          --    "n",
          --    "<leader>rg",
          --    ":grep ",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },
          -- -- vimgrep search word
          -- {
          --    "n",
          --    "<leader>rw",
          --    "\"zyiw:grep <c-r>z",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },
          -- -- vimgrep search WORD
          -- {
          --    "n",
          --    "<leader>rW",
          --    "\"zyiW:grep <c-r>z",
          --    { silent = false },
          --    "Ripgrep Search Empty",
          --    "ripgrep_search_empty",
          --    "Ripgrep Search Empty"
          -- },
          -- -- vimgrep search word solo
          -- -- vimgrep search WORD solo
          -- -- :cdo empty
          -- {
          --    "n",
          --    "<leader>rce",
          --    ":cdo s//gc<Left><Left><Left>",
          --    { silent = false },
          --    "Quickfix cdo Empty",
          --    "quickfix_cdo_empty",
          --    "Quickfix cdo Empty"
          -- },
          -- -- :cdo replace word
          -- {
          --    "n",
          --    "<leader>rcw",
          --    "\"zyiw:cdo s/<c-r>z//gc<Left><Left><Left>",
          --    { silent = false },
          --    "Quickfix cdo (w)ord",
          --    "quickfix_cdo_word_small",
          --    "Quickfix cdo (w)ord",
          -- },
          -- -- :cdo replace WORD
          -- {
          --    "n",
          --    "<leader>rcW",
          --    "\"zyiW:cdo s/<c-r>z//gc<Left><Left><Left>",
          --    { silent = false },
          --    "Quickfix cdo (W)ord",
          --    "quickfix_cdo_word_big",
          --    "Quickfix cdo (W)ord",
          -- },
          -- -- :cdo solo word
          -- {
          --    "n",
          --    "<leader>rcs",
          --    "\"zyiw:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
          --    { silent = false },
          --    "Quickfix cdo solo (w)ord",
          --    "quickfix_cdo_solo_word_small",
          --    "Quickfix cdo solo(w)ord",
          -- },
          -- -- :cdo solo WORD
          -- {
          --    "n",
          --    "<leader>rcS",
          --    "\"zyiW:cdo s/\\<<c-r>z\\>//gc<Left><Left><Left>",
          --    { silent = false },
          --    "Quickfix cdo solo (W)ord",
          --    "quickfix_cdo_solo_word_big",
          --    "Quickfix cdo solo (W)ord",
          -- },
          -- },
          -- },
        },
      }, -- search
    }, -- leader
  }
end

return search_and_replace
