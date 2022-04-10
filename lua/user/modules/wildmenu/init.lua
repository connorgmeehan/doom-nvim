local cmdline = {}

cmdline.packages = {
  ["wilder.nvi"] = { "gelguy/wilder.nvim" }, -- compleition
}

-- wilder example configs >> https://github.com/gelguy/wilder.nvim#example-configs

cmdline.configs = {}
local config_read = function()
  local wilder = require("wilder")
  wilder.setup({ modes = { ":", "/", "?" } })

  -- For every wilder#foo() method, the wilder Lua module exposes a wilder.foo()
  -- method in Lua. All function arguments are the same and only needs to be
  -- translated to the Lua equivalent. Note: this is achieved by using a Vim Script
  -- to Lua wrapper shim which introduces some overhead. The core logic is still
  -- written in Vim Script so a Lua configuration is in general not more performant
  -- than a Vim Script configuration.

  -- # CUSTOMIZING PIPELINE

  -- Use wilder#set_option('pipeline', <pipeline>) to customise the pipeline. The
  -- pipeline is a list of functions (referred to as pipes) which are executed in
  -- order, passing the result of the previous function to the next one. For
  -- example, in Neovim or Vim with yarp, to use fuzzy matching instead of substring
  -- matching:
  -- wilder#branch() is a higher-order pipe which is able to provide control flow
  -- given its own lists of pipelines. Note: For Lua, wilder.branch() takes a
  -- variadic list of arguments and so cannot have a trailing comma. See the docs
  -- at :h wilder-pipeline for a more details.

  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        -- sets the language to use, 'vim' and 'python' are supported
        language = "python",
        -- 0 turns off fuzzy matching
        -- 1 turns on fuzzy matching
        -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
        fuzzy = 1,
      }),
      wilder.python_search_pipeline({
        -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
        pattern = wilder.python_fuzzy_pattern(),
        -- omit to get results in the order they appear in the buffer
        sorter = wilder.python_difflib_sorter(),
        -- can be set to 're2' for performance, requires pyre2 to be installed
        -- see :h wilder#python_search() for more details
        engine = "re",
      })
    ),
  })

  -- When getting file completions, fuzzily search and match through all files
  -- under the project directory. Has to be placed above
  -- wilder#cmdline_pipeline().
  -- To optimise for performance, the file_command, dir_command and filters
  -- options can be customised. See :h wilder#python_file_finder_pipeline() for
  -- more details.
  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.python_file_finder_pipeline({
        -- to use ripgrep : {'rg', '--files'}
        -- to use fd      : {'fd', '-tf'}
        file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
        -- to use fd      : {'fd', '-td'}
        dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
        -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
        -- found at https://github.com/nixprime/cpsm
        filters = { "fuzzy_filter", "difflib_sorter" },
      }),
      wilder.cmdline_pipeline(),
      wilder.python_search_pipeline()
    ),
  })

  -- # CUSTOMIZING RENDERER

  -- Use wilder#set_option('renderer', <renderer>) to change how wilder draws the
  -- results. By default, wilder tries its best to look like the default wildmenu.
  --   wilder#wildmenu_renderer() draws the candidates above the cmdline. For Neovim
  -- 0.4+, a floating window is used. For Vim 8.1+ with popup support, a popup
  -- window is used. Otherwise the statusline is used. Note: When using the
  --   statusline, the wildmenu will only show on the statusline of the current
  --   window.
  wilder.set_option(
    "renderer",
    wilder.wildmenu_renderer({
      -- highlighter applies highlighting to the candidates
      highlighter = wilder.basic_highlighter(),
    })
  )
  wilder.set_option(
    "renderer",
    wilder.wildmenu_renderer({
      highlighter = wilder.basic_highlighter(),
      separator = " · ",
      left = { " ", wilder.wildmenu_spinner(), " " },
      right = { " ", wilder.wildmenu_index() },
    })
  )

  -- For Airline and Lightline users, wilder#wildmenu_airline_theme() and
  --   wilder#wildmenu_lightline_theme() can be used.
  wilder.set_option(
    "renderer",
    wilder.wildmenu_renderer(
      -- use wilder.wildmenu_lightline_theme() if using Lightline
      wilder.wildmenu_airline_theme({
        -- highlights can be overriden, see :h wilder#wildmenu_renderer()
        highlights = { default = "StatusLine" },
        highlighter = wilder.basic_highlighter(),
        separator = " · ",
      })
    )
  )

  -- # POPUP RENDERER

  -- For Neovim 0.4+ or Vim 8.1+ with popup support,
  -- wilder#popupmenu_renderer() can be used to draw the results on a
  -- popupmenu, similar to wildoptions+=pum. The implementation for Vim is
  -- still experimental.
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      -- highlighter applies highlighting to the candidates
      highlighter = wilder.basic_highlighter(),
    })
  )
  -- Use wilder#renderer_mux() to choose which renderer to use for different
  -- cmdline modes. This is helpful since the popupmenu might overlap the
  -- current window when searching with /.
  wilder.set_option(
    "renderer",
    wilder.renderer_mux({
      [":"] = wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }),
      ["/"] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }),
    })
  )
  -- For Neovim, the pumblend option can be set to change the transparency of the popupmenu. By default, the value of the &pumblend option is used. To disable transparency, set the value to 0.
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      pumblend = 20,
    })
  )
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      highlights = {
        border = "Normal", -- highlight to use for the border
      },
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
      border = "rounded",
    }))
  )
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      highlighter = wilder.basic_highlighter(),
      min_width = "100%", -- minimum height of the popupmenu, can also be a number
      min_height = "50%", -- to set a fixed height, set max_height to the same value
      reverse = 0, -- if 1, shows the candidates from bottom to top
    }))
  )
  -- Supports ryanoasis/vim-devicons, kyazdani42/nvim-web-devicons and
  -- lambdalisue/nerdfont.vim by default. To use other plugins, the get_icon
  -- option can be changed. See :h wilder#popupmenu_devicons for more details.
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      highlighter = wilder.basic_highlighter(),
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
    })
  )
  -- wilder#popupmenu_palette_theme() can be used to draw the popupmenu in the
  -- middle of the screen, similar to a command palette.
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
      border = "rounded",
      max_height = "75%", -- max height of the palette
      min_height = 0, -- set to the same as 'max_height' for a fixed height window
      prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    }))
  )

  -- The highlighter option for both wilder#wildmenu_renderer() and
  -- wilder#popupmenu_renderer() can be changed for better fuzzy highlighting. The
  -- highlights.accent option sets the highlight group to use for the matched
  -- characters. wilder#make_hl() is a helper method which creates a new highlight
  -- group based on the attributes of an existing one. Basic configuration for
  -- both Vim and Neovim:
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      highlighter = {
        wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
        wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
        -- at https://github.com/romgrk/fzy-lua-native
      },
      highlights = {
        accent = wilder.make_hl(
          "WilderAccent",
          "Pmenu",
          { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
        ),
      },
    })
  )
  local gradient = {
    "#f4468f",
    "#fd4a85",
    "#ff507a",
    "#ff566f",
    "#ff5e63",
    "#ff6658",
    "#ff704e",
    "#ff7a45",
    "#ff843d",
    "#ff9036",
    "#f89b31",
    "#efa72f",
    "#e6b32e",
    "#dcbe30",
    "#d2c934",
    "#c8d43a",
    "#bfde43",
    "#b6e84e",
    "#aff05b",
  }

  for i, fg in ipairs(gradient) do
    gradient[i] = wilder.make_hl(
      "WilderGradient" .. i,
      "Pmenu",
      { { a = 1 }, { a = 1 }, { foreground = fg } }
    )
  end

  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      highlights = {
        gradient = gradient, -- must be set
        -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
      },
      highlighter = wilder.highlighter_with_gradient({
        wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
      }),
    })
  )
  --
end

-- this example is the most advanced one according to readme...
-- Requires fd from sharkdp/fd (see :h wilder#python_file_finder_pipeline() on using other commands)
-- Requires cpsm from nixprime/cpsm
-- Requires fzy-lua-native from romgrk/fzy-lua-native
-- Requires nvim-web-devicons from kyazdani42/nvim-web-devicons or vim-devicons from ryanoasis/vim-devicons or nerdfont.vim from lambdalisue/nerdfont.vim
cmdline.configs["wilder.nvim"] = function()
  local wilder = require("wilder")
  wilder.setup({ modes = { ":", "/", "?" } })

  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.python_file_finder_pipeline({
        file_command = function(ctx, arg)
          if string.find(arg, ".") ~= nil then
            return { "fdfind", "-tf", "-H" }
          else
            return { "fdfind", "-tf" }
          end
        end,
        dir_command = { "fd", "-td" },
        filters = { "cpsm_filter" },
      }),
      wilder.substitute_pipeline({
        pipeline = wilder.python_search_pipeline({
          skip_cmdtype_check = 1,
          pattern = wilder.python_fuzzy_pattern({
            start_at_boundary = 0,
          }),
        }),
      }),
      wilder.cmdline_pipeline({
        fuzzy = 2,
        fuzzy_filter = wilder.lua_fzy_filter(),
      }),
      {
        wilder.check(function(ctx, x)
          return x == ""
        end),
        wilder.history(),
      },
      wilder.python_search_pipeline({
        pattern = wilder.python_fuzzy_pattern({
          start_at_boundary = 0,
        }),
      })
    ),
  })

  local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.lua_fzy_highlighter(),
  }

  local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
    border = "rounded",
    empty_message = wilder.popupmenu_empty_message_with_spinner(),
    highlighter = highlighters,
    left = {
      " ",
      wilder.popupmenu_devicons(),
      wilder.popupmenu_buffer_flags({
        flags = " a + ",
        icons = { ["+"] = "", a = "", h = "" },
      }),
    },
    right = {
      " ",
      wilder.popupmenu_scrollbar(),
    },
  }))

  local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = highlighters,
    separator = " · ",
    left = { " ", wilder.wildmenu_spinner(), " " },
    right = { " ", wilder.wildmenu_index() },
  })

  wilder.set_option(
    "renderer",
    wilder.renderer_mux({
      [":"] = popupmenu_renderer,
      ["/"] = wildmenu_renderer,
      substitute = wildmenu_renderer,
    })
  )
end

return cmdline
