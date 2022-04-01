local user_utils = require("user.utils")

local binds_create = {}

binds_create.settings = {
  input = {
    position = '50%',
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
    }
  }
}

binds_create.cmds = {
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

-- if require("doom.utils").is_module_enabled("whichkey") then
--   binds_create.binds = {
--     {
--       "<leader>i",
--       name = "+info",
--       {
--         { "c", "<cmd>:CountPrint<CR>", name = "Print new chars" }, -- Binds `:CountPrint` to `<leader>ic`
--       },
--     },
--   }
-- end

return binds_create
