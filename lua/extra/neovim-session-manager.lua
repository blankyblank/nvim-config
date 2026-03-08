vim.pack.add({
  Gh("Shatur/neovim-session-manager"),
  Gh("nvim-lua/plenary.nvim"),
})

local config = require('session_manager.config')
require('session_manager').setup({
  autoload_mode = config.AutoloadMode.Disabled,
})
