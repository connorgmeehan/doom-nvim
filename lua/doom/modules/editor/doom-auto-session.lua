-- [[
-- Persistence is a simple lua plugin for automated session management.
-- ]]

--- @type DoomModule
local module = {}

module.config = function ()
  require("persistence").setup({
    dir = vim.fn.stdpath("data") .. "/sessions/",
  })
end

module.setup = function (use)
  use({
    "folke/persistence.nvim",
    commit = "77cf5a6ee162013b97237ff25450080401849f85",
    config = module.config,
    -- event = "VimEnter",
  })
end

module.keymaps = {
  { '<leader>q', name = '+Quit/Sessions', {
    { 'r', '<cmd>lua require("persistence").load({ last = true })<CR>', 'Restore previously saved session', category = "Editor", uid = 'restore_session' },
  }}
}

return module


