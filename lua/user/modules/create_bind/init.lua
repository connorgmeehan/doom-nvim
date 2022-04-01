-- need nui, to get user input

local user_utils = require("user.utils")

local binds_create = {}

-- A. command get user input and see if it passes the binds string parses

-- B. command load table from a file and see if all strings in table passes the parser

-- C. use sort to sort bindings in a table

binds_create.settings = {}

-- char_counter._insert_enter_char_count = nil
-- char_counter._accumulated_difference = 0
-- char_counter._get_current_buffer_char_count = function()
--   local lines = vim.api.nvim_buf_line_count(0)
--   local chars = 0
--   for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, lines, false)) do
--     chars = chars + #line
--   end
--   return chars
-- end

binds_create.autocmds = {
  -- {
  --   "InsertEnter",
  --   "*",
  --   function()
  --     -- Only operate on normal file buffers
  --     print(("buftype: %s"):format(vim.bo.buftype))
  --     if vim.bo.buftype == "" then
  --       -- Store current char count
  --       char_counter._insert_enter_char_count = char_counter._get_current_buffer_char_count()
  --     end
  --   end,
  -- },
  -- {
  --   "InsertLeave",
  --   "*",
  --   function()
  --     -- Only operate on normal file buffers
  --     if vim.bo.buftype == "" and char_counter._insert_enter_char_count then
  --       -- Find the amount of chars added or removed
  --       local new_count = char_counter._get_current_buffer_char_count()
  --       local diff = new_count - char_counter._insert_enter_char_count
  --       print(new_count, diff)
  --       -- Add the difference to the accumulated total
  --       char_counter._accumulated_difference = char_counter._accumulated_difference + diff
  --       print(("Accumulated difference %s"):format(char_counter._accumulated_difference))
  --     end
  --   end,
  -- },
}

binds_create.cmds = {
  -- {
  --   "CountPrint",
  --   function()
  --     local Popup = require("nui.popup")
  --     local popup = Popup(char_counter.settings.popup)
  --     popup:mount()
  --     popup:map("n", "<esc>", function()
  --       popup:unmount()
  --     end)
  --
  --     local msg = ("char_counter: You have typed %s characters since I started counting."):format(
  --       char_counter._accumulated_difference
  --     )
  --     vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { msg })
  --   end,
  -- },
  -- {
  --   "CountReset",
  --   function()
  --     char_counter._accumulated_difference = 0
  --     vim.notify("char_counter: Reset count!", "info")
  --   end,
  -- },
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
  },
}

binds_create.binds = {
  {
    "<leader>i",
    name = "+info",
    { -- Adds a new `whichkey` folder called `+info`
      { "c", "<cmd>:CountPrint<CR>", name = "Print new chars" }, -- Binds `:CountPrint` to `<leader>ic`
      { "r", "<cmd>:CountReset<CR>", name = "Reset char count" }, -- Binds `:CountPrint` to `<leader>ic`
    },
  },
}

return binds_create
