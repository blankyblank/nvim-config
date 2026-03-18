Gh = function(x)
  return 'https://github.com/' .. x
end

-- snacks relies on mini
require('plugins.mini')
require('plugins.snacks')
require('plugins.onedark')
require('plugins.project')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.colorizer')
require('plugins.vim-suda')
-- cmp relies on clangd_extensions
require('plugins.clangd_extensions')
require('plugins.nvim-lsp')
require('plugins.nvim-cmp')
require('plugins.mason')
require('plugins.conform')
require('plugins.dap')
-- require('plugins.rust')
