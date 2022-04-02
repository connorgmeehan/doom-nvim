local user_utils = require("user.utils")

local binds_create = {}

-- lsp.binds = {
--   {
--     "<leader>",
--     name = "+prefix",
--     {
--       {
--         "c",
--         name = "+code",
--         {
--           { "r", vim.lsp.buf.rename, name = "Rename" },
--           { "a", vim.lsp.buf.code_action, name = "Do action" },
--           { "t", vim.lsp.buf.type_definition, name = "Jump to type" },
--           { "D", vim.lsp.buf.declaration, "Jump to declaration" },
--           { "d", vim.lsp.buf.definition, name = "Jump to definition" },
--           { "R", vim.lsp.buf.references, name = "Jump to references" },
--           { "i", vim.lsp.buf.implementation, name = "Jump to implementation" },
--           {
--             "l",
--             name = "+lsp",
--             {
--               { "i", "<cmd>LspInfo<CR>", name = "Inform" },
--               { "r", "<cmd>LspRestart<CR>", name = "Restart" },
--               { "s", "<cmd>LspStart<CR>", name = "Start" },
--               { "d", "<cmd>LspStop<CR>", name = "Disconnect" },
--             },
--           },
--           {
--             "d",
--             name = "+diagnostics",
--             {
--               { "[", vim.diagnostic.goto_prev, name = "Jump to prev" },
--               { "]", vim.diagnostic.goto_next, name = "Jump to next" },
--               { "p", vim.diagnostic.goto_prev, name = "Jump to prev" },
--               { "n", vim.diagnostic.goto_next, name = "Jump to next" },
--               {
--                 "L",
--                 function()
--                   vim.diagnostic.open_float(0, {
--                     focusable = false,
--                     border = doom.border_style,
--                   })
--                 end,
--                 name = "Line",
--               },
--               { "l", vim.lsp.diagnostic.set_loclist, name = "Loclist" },
--             },
--           },
--         },
--       },
--       {
--         "t",
--         name = "+tweak",
--         {
--           { "c", function() require("doom.core.functions").toggle_completion() end, name = "Toggle completion" },
--         },
--       },
--     },
--   }
-- }

local t_mini_syntax_test = {
  --   { "ZZ", require("doom.core.functions").quit_doom, name = "Fast exit" },
  --   { "<ESC>", ":noh<CR>", name = "Remove search highlight" },
  --   { "<Tab>", ":bnext<CR>", name = "Jump to next buffer" },
  --   { "<S-Tab>", ":bprevious<CR>", name = "Jump to prev buffer" },

  --   { "K", vim.lsp.buf.hover, name = "Show hover doc" },
--   { "[d", vim.diagnostic.goto_prev, name = "Jump to prev diagnostic" },
--   { "]d", vim.diagnostic.goto_next, name = "Jump to next diagnostic" },
--   {
--     "g",
--     {
--       { "D", vim.lsp.buf.declaration, "Jump to declaration" },
--       { "d", vim.lsp.buf.definition, name = "Jump to definition" },
--       { "r", vim.lsp.buf.references, name = "Jump to references" },
--       { "i", vim.lsp.buf.implementation, name = "Jump to implementation" },
--       { "a", vim.lsp.buf.code_action, name = "Do code action" },
--     },
--   },
--   {
--     "<C-",
--     {
--       { "p>", vim.lsp.diagnostic.goto_prev, name = "Jump to prev diagnostic" },
--       { "n>", vim.lsp.diagnostic.goto_next, name = "Jump to next diagnostic" },
--       { "k>", vim.lsp.buf.signature_help, name = "Show signature help" },
--     },
--   },


  -- NEW SPECIAL CASE WHERE SUBTABLES COMBINE INTO THE COMMAND
  --   {
  --     "<C-",
  --     {
  --       { "h>", "<C-w>h", name = "Jump window left" },
  --       { "j>", "<C-w>j", name = "Jump window down" },
  --       { "k>", "<C-w>k", name = "Jump window up" },
  --       { "l>", "<C-w>l", name = "Jump window right" },
  --       {
  --         mode = "nv",
  --         {
  --           { "Left>", ":vertical resize -2<CR>", name = "Resize window left" },
  --           { "Down>", ":resize -2<CR>", name = "Resize window down" },
  --           { "Up>", ":resize +2<CR>", name = "Resize window up" },
  --           { "Right>", ":vertical resize +2<CR>", name = "Resize window right" },
  --         },
  --       },
  --     },
  --   },

  -- {
  --     "<a-",
  --     {
  --       { "j>", ":m .+1<CR>==", name = "Move line down" },
  --       { "k>", ":m .-2<CR>==", name = "Move line up" },
  --     },
  --   }

  --   {
  --     mode = "v",
  --     {
  --       {
  --         "<a-",
  --         {
  --           { "j>", ":m '<+1<CR>gv=gv", name = "Move line down", mode = "v" },
  --           { "k>", ":m '<-2<CR>gv=gv", name = "Move line up", mode = "v" },
  --         },
  --       },
  --       { ">", ">gv", mode = "v" }, -- Stay in visual after indent.
  --       { "<", "<gv", mode = "v" }, -- Stay in visual after indent.
  --     },
  --   },

  [[ n  command_one       s B sf ]],
  [[ n  second_command    <c-z> :sus s ]],
  [[ n  this_is_the_third <c-z> :sus sn ]],
  [[ x  and_the_fourth    <c-z> :DoomReload sn ]],
  -- no options
  [[ x  and_the_fourth <c-z> :DoomReload ]],
  -- function command
  [" x the_name <c-z> sn "] = function()
    print("hello")
  end,
  -- function command no options
  [" x the_name <c-z> "] = function()
    print("hello")
  end,
  -- leader
  [" G namerst"] = {
    [[ a b c d ]],
    [[ e f g h ]],
  },
}

binds_create.settings = {
  input = {
    position = "50%",
    size = {
      width = 80,
      height = 40,
    },
    border = {
      padding = {
        top = 2,
        bottom = 2,
        left = 3,
        right = 3,
      },
    },
    style = "rounded",
    enter = true,
    buf_options = {
      modifiable = true,
      readonly = true,
    },
  },
}

binds_create.cmds = {
  {
    "MiniSyntaxTest",
    function()
      user_utils.mappings_parse_mini_syntax(t_mini_syntax_test)
    end,
  },
  {
    "BindsCreateGetInput",
    function()
      local Input = require("nui.input")
      local event = require("nui.utils.autocmd").event

      local popup_options = {
        relative = "cursor",
        position = {
          row = 1,
          col = 0,
        },
        size = 20,
        border = {
          style = "rounded",
          text = {
            top = "[Input]",
            top_align = "left",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal",
        },
      }

      local input = Input(popup_options, {
        prompt = "> ",
        default_value = "42",
        on_close = function()
          print("Input closed!")
        end,
        on_submit = function(value)
          -- print("Value submitted: ", value)
          user_utils.parse_mappings_str_syntax(value)
        end,
        on_change = function(value)
          print("Value changed: ", value)
        end,
      })
      -- mount/open the component
      input:mount()

      -- unmount component when cursor leaves buffer
      input:on(event.BufLeave, function()
        input:unmount()
      end)
      -- pass string through parser
      -- print result
    end,
  }, -- BindsCreateGetInput
}

if require("doom.utils").is_module_enabled("whichkey") then
  binds_create.binds = {
    {
      "<leader>M",
      name = "+moll",
      {
        { "i", "<cmd>:BindsCreateGetInput<CR>", name = "creab binds test input" },
        { "I", "<cmd>:MiniSyntaxTest<CR>", name = "create binds syntax test" },
      },
    },
  }
end

return binds_create
