-- [[
-- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
-- ]]

--- @type DoomModule
local module = {}

module.config = function ()
  local telescope = require("telescope")
  -- Required to close with ESC in insert mode
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      find_command = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      prompt_prefix = "   ",
      selection_caret = " ",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        prompt_position = "bottom",
        vertical = { mirror = false },
        horizontal = {
          mirror = false,
          preview_width = 0.6,
        },
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "^%.git/", "^node_modules/", "^__pycache__/" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      winblend = 0,
      scroll_strategy = "cycle",
      border = {},
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "╭",
        "╮",
        "╯",
        "╰",
      },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<Leader>f"] = actions.close, -- works like a toggle, sometimes can be buggy
          ["<CR>"] = actions.select_default + actions.center,
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
    },
  })

  telescope.load_extension("mapper")
  -- Trigger nest.nvim integration
  local doom_nest = require('doom.modules.core.doom-nest')
  doom_nest.on_integration_loaded('mapper')
end

module.setup = function (use)
  print('setup telescope')
  use({
    "nvim-telescope/telescope.nvim",
    commit = "1c57cc6140644695f0d9bd71b63de45feeca6ae7",
    cmd = "Telescope",
    module = "telescope",
    requires = {
      "popup.nvim",
      "plenary.nvim",
    },
    config = module.config,
  })
  use({
    "lazytanuki/nvim-mapper",
    commit = "e11e852bafa41a4a2c160fcd2d38779add423db9",
    config = function()
      local doom_root, sep = require("doom.core.system").doom_root, require("doom.core.system").sep
      require("nvim-mapper").setup({
        -- do not assign the default keymap (<leader>MM)
        no_map = true,
        -- where should ripgrep look for your keybinds definitions.
        -- Default config search path is ~/.config/nvim/lua
        search_path = string.format("%s%slua", doom_root, sep),
        -- what should be done with the selected keybind when pressing enter.
        -- Available actions:
        --   * "definition" - Go to keybind definition (default)
        --   * "execute" - Execute the keybind command
        action_on_enter = "execute",
      })
    end,
  })
end

module.keymaps = {
  { '<leader>`', "<cmd>lua require('telescope.builtin').find_files({cwd=vim.fn.expand('%:p:h')})<CR>", 'Cwd browse files', category = "Editor", uid = 'cwd_file_browser' },
  { '<leader>.', "<cmd>Telescope file_browser<CR>", 'Browse files',  category = "Editor", uid = 'file_browser' },
  { '<leader>,', "<cmd>Telescope buffers show_all_buffers=true<CR>", 'Find buffer',  category = "Editor", uid = 'find_buffers' },
  { '<leader>/', "<cmd>Telescope live_grep<CR>", 'Search a word',  category = "Editor", uid = 'live_grep_alt' },
  { '<leader>:', "<cmd>Telescope command_history<CR>", 'Command history',  category = "Editor", uid = 'command_history_alt' },
  { '<leader>f', name = '+Files', {
    { 'f', '<cmd>Telescope find_files<CR>', 'Find files', category = 'Editor', uid = 'find_files'},
    { 'r', '<cmd>Telescope oldfiles<CR>', 'Recent files', category = 'Editor', uid = 'recent_files'},
    { 't', '<cmd>Telescope help_tags<CR>', 'Help tags', category = 'Editor', uid = 'help_tags'},
  }},
  { '<leader>s', name = '+Search', {
    { 'g', '<cmd>Telescope live_grep<CR>', 'Search a word', category = 'Editor', uid = 'live_grep'},
    { 'b', '<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Search in buffer', category = 'Editor', uid = 'grep_buffer'},
    { 's', '<cmd>Telescope lsp_document_symbols<CR>', 'Goto symbol', category = 'Editor', uid = 'lsp_symbols'},
    { 'h', '<cmd>Telescope command_history<CR>', 'Command history', category = 'Editor', uid = 'command_history'},
    { 'm', '<cmd>Telescope marks<CR>', 'Command history', category = 'Editor', uid = 'jump_mark'},
    { 'k', '<cmd>Telescope mapper<CR>', 'Keybindings', category = 'Editor', uid = 'search_mapper'},
  }},
  { '<leader>g', name = '+Git', {
    { 's', '<cmd>Telescope git_status<CR>', 'Browse git status', category = 'Editor', uid = 'git_status'},
    { 'B', '<cmd>Telescope branches<CR>', 'Switch branch', category = 'Editor', uid = 'git_branches'},
    { 'c', '<cmd>Telescope git_commits<CR>', 'Browse commits', category = 'Editor', uid = 'git_commits'},
  }},
  { '<leader>d', name = '+Doom', {
    { 'b', '<cmd>Telescope mapper<CR>', 'Show doom keybindings', category = 'Doom', uid = 'show_keybindings' },
  }}
}

return module


