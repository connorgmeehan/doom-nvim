local bind = function(t) print(t) end

-- only mult seq chars if not leader, since each branch needs a name...
--
-- if empty table ignore.
--
-- if only string -> full command has to be parseable from string
--
-- if value = function -> then make mapping where command = value function
--
-- if value is = table -> this means new level

-- syntax = [[ <chars> | <mode> | <name> | ]]

-- if using pipes then you could have the table be formatted nicely and line up everything
-- when you write the table.


-- NEW DEMO | CAPITALIZE LEADER STEPS
--
-- 1. add regular binds, and leader to the same table? how?
bind {
  ["!LEADER"] = { -- use ! to disable
    " asd sdfasdf",
    " c  | n   | the name                | exec/silent/nore | <cmd>do hsomething<cr>",
    " x  | n   | name_of_the_bind        | grzz",
    " e  | isx | snippets_do_something   | <cmd>vim.fn.call_some_of_thegood_stuff()",
    " a  | nt  | normal_and_terminal_esc | <esc><cmd>close.terminal.window()",
    " zf | i   | normal_and_terminal_esc | <esc>vcF",
    ["zf | i   | normal_and_terminal_esc "] = function () vim.cmd([[print xyz ]]) end,

    "a_add_a_binding_Csus",
    b_name_of_the_bind = "<cmd>!shell xyz<cr>",
    ["b/another_bind"] = "<cmd>!shell xyz<cr>",
    "c/the name/command goes here",
    "d/this is the next command/<cmd>lua do_something_cool()", -- add a helper that escapes strings in bindings.
    "e_here_comes_another_keybinds_CBvipzr",
    f_another_bind_name = function ()
      -- run this functions on trigger
    end,
    g_yet_another_fn_bind = function() print("arst") end,
    ["u_bind_with_opts"] = { function() print("zz") end, options = { "..." }},
    "k/visual/the name/opts.../the command",
    l_LSP = {
      "x/another_key/<cmd>do something",
      d_DIAGNOSTICS = {
        "j_jump_to_next/<cmd>lua call next()",
        "l_loclist/<cmd>do loclist()",
        x_ANOTHER_LEVEL = {
          "k_ersnri_st_esnt",
          "e_nteorst_iste",
          "t_anrese_erstn"
        }
      },
      "rs.arsttt",
      "k/rename_symbol/<cmd>do something",
      y_jump_to_def = { '2' },
      s_SOME = {
        a_jump = { '3' },
        b_get_some = { '3' },
        c_jump_to_next = {
          function()
            print("arst")
          end,
          options = "exec"
        }
      },
      x_CUT = {
        r_aaa = { '3' },
        s_UUP_SFRR_SFTT = { '3' },
        i_sttt = { '3' }
      }
    },
    ["._fix_something"] = { '1' },
    [",_do_comma"] = { '1' },
    x_copy_something = { '1' },
    q_MACRO = {
      s_rrr_ss_rstars_sssss_ss = { '2'},
      s_rrr_xxyz = { '2'},
      "c/bind name/the command goes here."
    }
  }
}

-- DAP
bind {
  ["d_DEBUG"] = {
    "arst srrr",
    "arst srrr",
    "arst srrr",
    ["c Continue/Start"] = function() require("dap").continue() end, -- function ... end is assumed ? could this be abstracted??
    ["d Disconnect"] = function() require("dap").disconnect() end,
    ["e Evaluate"] = function() require("dapui").eval() end,
    ["e Evaluate (v)"] = function() require("dapui").eval() end, -- mode visual; how can this be here ?!
    ["b_BREAKPOINT"] = {
      ["b toggle breakpoint"] = function() require("dap").toggle_breakpoint() end,
      ["c toggle"] = function()
        vim.fn.inputsave()
        local condition = vim.fn.input("Condition: ")
        vim.fn.inputrestore()
        require("dap").toggle_breakpoint(condition)
      end,
      ["h hit number"] = function()
        vim.fn.inputsave()
        local number = vim.fn.input("Hit number: ")
        vim.fn.inputrestore()
        require("dap").toggle_breakpoint(nil, number)
      end,
      ["l log"] = function()
        vim.fn.inputsave()
        local msg = vim.fn.input("Message: ")
        vim.fn.inputrestore()
        require("dap").toggle_breakpoint(nil, nil, msg)
      end,
    }, -- b_BREAKPOINT
  },
  ["o_OPEN"] = {
    ["d debugger"] = function() require("dapui").toggle() end,
  },
}


-- LSP
bind {
  "K/show hover docs/vim.lsp.buf.hover",
  "[d jump_to_prev diagnostic -> [[ vim.diagnostic.goto_prev ]]",
  "]d Jump_to_next_diagnostic -> vim.diagnostic.goto_next",
  g = {
    "D : normal : Jump to declaration.[[ vim.lsp.buf.declaration ]]",
    "d : Jump to definition.[[ vim.lsp.buf.definition ]]",
    "r : Jump to references vim.lsp.buf.references",
    "i : Jump to implementation vim.lsp.buf.implementation",
    "a : Do code action" = vim.lsp.buf.code_action,  -- char / name = func command
  },
  {
    "<C-",
    {
      { "p>", vim.lsp.diagnostic.goto_prev, name = "Jump to prev diagnostic" },
      { "n>", vim.lsp.diagnostic.goto_next, name = "Jump to next diagnostic" },
      { "k>", vim.lsp.buf.signature_help, name = "Show signature help" },
    },
  },
  {
    "<leader>",
    name = "+prefix",
    {
      {
        "c",
        name = "+code",
        {
          { "r", vim.lsp.buf.rename, name = "Rename" },
          { "a", vim.lsp.buf.code_action, name = "Do action" },
          { "t", vim.lsp.buf.type_definition, name = "Jump to type" },
          { "D", vim.lsp.buf.declaration, "Jump to declaration" },
          { "d", vim.lsp.buf.definition, name = "Jump to definition" },
          { "R", vim.lsp.buf.references, name = "Jump to references" },
          { "i", vim.lsp.buf.implementation, name = "Jump to implementation" },
          {
            "l",
            name = "+lsp",
            {
              { "i", "<cmd>LspInfo<CR>", name = "Inform" },
              { "r", "<cmd>LspRestart<CR>", name = "Restart" },
              { "s", "<cmd>LspStart<CR>", name = "Start" },
              { "d", "<cmd>LspStop<CR>", name = "Disconnect" },
            },
          },
          {
            "d",
            name = "+diagnostics",
            {
              { "[", vim.diagnostic.goto_prev, name = "Jump to prev" },
              { "]", vim.diagnostic.goto_next, name = "Jump to next" },
              { "p", vim.diagnostic.goto_prev, name = "Jump to prev" },
              { "n", vim.diagnostic.goto_next, name = "Jump to next" },
              {
                "L",
                function()
                  vim.diagnostic.open_float(0, {
                    focusable = false,
                    border = doom.border_style,
                  })
                end,
                name = "Line",
              },
              { "l", vim.lsp.diagnostic.set_loclist, name = "Loclist" },
            },
          },
        },
      },
      {
        "t",
        name = "+tweak",
        {
          { "c", function() require("doom.core.functions").toggle_completion() end, name = "Toggle completion" },
        },
      },
    },
  }
}


neogit.binds = {
  "<leader>",
  name = "+prefix",
  {
    {
      "o",
      name = "+open/close",
      {
        { "g", "<cmd>Neogit<CR>", name = "Neogit" },
      },
    },
    {
      "g",
      name = "+git",
      {
        { "g", "<cmd>Neogit<CR>", name = "Open neogit" },
      },
    },
  },
}





comment.binds = {
  {
    "gc",
    [[<cmd>lua require("Comment.api").call("toggle_linewise_op")<CR>g@]],
    name = "Comment motion",
  },
  {
    "gc",
    [[<Esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>]],
    name = "Comment line",
    mode = "v",
  },
  {
    "gb",
    [[<Esc><cmd>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>]],
    name = "Comment block",
    mode = "v",
  },
  {
    "gcc",
    [[<cmd>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$]],
    name = "Comment line",
  },
  {
    "gcA",
    [[<cmd>lua require("Comment.api").insert_linewise_eol()<CR>]],
    name = "Comment end of line",
  },
}
return comment
