-- modules.lua - Doom nvim module selection
--
-- modules.lua controls what Doom nvim plugins modules are enabled and
-- what eeatures are being used.
--
-- Uncomment a plugin to enable it and comment out to disable and uninstall it.

return {
  features = {
    -- Language features (33ms)
    "annotations", -- Code annotation generator
    "auto_install", -- Auto install LSP providers
    "autopairs", -- Automatically close character pairs
    "comment", -- Adds keybinds to comment in any language
    "linter", -- Linting and formatting for languages
    "lsp", -- Code completion
    -- "snippets", -- Code snippets for all languages

    -- Editor (34ms, 1ms)
    "auto_session", -- Remember sessions between loads
    "colorizer", -- Show colors in neovim
    "editorconfig", -- Support editorconfig files
    "gitsigns", -- Show git changes in sidebar
    "illuminate", -- Highlight other copies of the word you're hovering on
    "indentlines", -- Show indent lines with special characters
    "range_highlight", -- Highlight selected range from commands
    "todo_comments", -- Highlight TODO: comments

    -- UI (44ms, 10ms)
    "lsp_progress", -- Check status of LSP loading
    "tabline", -- Tab bar buffer switcher
    "dashboard", -- A pretty dashboard upon opening
    "trouble", -- A pretty diagnostic viewer
    "statusline2", -- A pretty status line at the bottom of the buffer
    "minimap", -- Shows current position in document

    -- Tools (188ms, 144ms)
    "dap", -- Debug code through neovim
    "explorer", -- An enhanced filetree explorer
    "firenvim", -- Embed neovim in your browser
    "telescope", -- Fuzzy searcher to find files, grep code and more
    "neorg", -- Organise your life
    "whichkey", -- An interactive sheet
    "projects", -- Quickly switch between projects
    "plugins_reloader", -- Auto reload local plugins

    "doom_themes", -- Extra themes for doom
    "lazygit", -- Lazy git integration
    -- "neogit", -- A git client for neovim
    "ranger", -- File explorer in neovim (TODO: Test)
    -- "restclient", -- Test HTTP requests from neovim (TODO: Test)
    "show_registers", -- Show and navigate between registers
    -- "suda",            -- Save using sudo when necessary
    "superman", -- Read unix man pages in neovim
    "symbols", -- Navigate between code symbols using telescope
    "terminal", -- Integrated terminal in neovim
    "zen", -- Distractionless coding
  },
  langs = {
    -- Scripts
    "lua",
    "python",
    "bash",

    -- Web
    "javascript",
    "typescript",
    "css",
    "vue",
    "svelte",
    "tailwindcss",

    -- Compiled
    "rust",
    "cpp",

    -- JIT
    "c_sharp",
    "kotlin",
    "java",

    "config", -- JSON, YAML, TOML
    "markdown",
  },
  user = {

    -- "ai",
    "architext",
    -- "async_jobs",
    -- "audio",
    -- "autocmds",
    "binds",
    "char_counter",
    -- "cmdline",
    -- "code_outline",
    -- "codeql",
    -- "coderunner",
    "collaborate",
    -- "color_scheme_creation",
    "color_schemes",
    "colors",
    "competitive",
    -- "config_old",
    -- "corerunner",

    "create_binds",
    "create_plugin",
    "create_snippet",

    "cursor",
    -- "cursorline",
    "data_science",
    -- "debugging",
    -- "diagrams",
    "docs",
    "doom_queries_manager",
    "editing",
    "fennel",
    "file_explorers",
    "folds",
    "formatting",
    "games",

    "ghq",
    "git",
    "git_diffview",
    "git_github",
    "git_neogit",
    "git_vgit",

    "gpg",
    -- "help",
    "highlighting",
    -- "icons",
    -- "increment",
    -- "indent",
    "latex",
    -- "litee",
    "logging",
    -- "lsp",
    -- "markdown",
    "math_calculator",
    "module_create_edit",
    -- "module_edit",
    "module_disable",
    "module_manager",
    "module_merge",
    "motion",
    "mouse",
    -- "neorg",
    "nvim_luadev",
    -- "pandoc",
    "paths",
    "plugins_fork",
    -- "printer",
    "quickfix",
    -- "read_file",
    "refactor",
    "regex",
    -- "remote_dev",
    -- "rename",
    -- "repo_search",
    "scim",
    "scroll",
    -- "search",
    "search_and_replace",
    "snippets",
    "sort",
    "ssh",
    -- "startup",
    -- "statusline",
    "surround",
    -- "tabline",
    -- "tabs",
    "tabular",
    "telescope_extensions",
    "telescope_doom_reloader",
    -- "terminal_integration",
    -- "testing",
    "ts_context",
    "ts_playground",
    "ts_query_monitor",
    "ts_testing",
    "tmux",
    "ui",
    "undo",
    "utilities",
    -- "websearch",
    -- "wildmenu",
    "windows",
    "wm",
  },
}

-- vim: sw=2 sts=2 ts=2 fdm=indent expandtab
