local python = {}

python.settings = {
  language_server_name = 'pyright',
}

python.autocmds = {
  {
    "FileType",
    "*.py",
    function()
      local langs_utils = require('doom.modules.langs.utils')
      langs_utils.use_lsp(doom.langs.python.settings.language_server_name)
      
      vim.defer_fn(function()
        require("nvim-treesitter.install").ensure_installed("python")
      end, 0)

      -- Setup null-ls
      if doom.modules.linter then
        local null_ls = require("null-ls")

        langs_utils.use_null_ls_source({
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.mypy
        })
      end

    end,
    once = true,
  },
}

return python
