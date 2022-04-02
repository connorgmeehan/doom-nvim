local user_utils = require("user.utils")

local binds_create = {}

local t_mini_syntax_test = {
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
        { "m", "<cmd>:MiniSyntaxTest<CR>", name = "create binds syntax test" },
      },
    },
  }
end

return binds_create
