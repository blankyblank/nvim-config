vim.pack.add({
  Gh('nvim-mini/mini.ai'),
  Gh('nvim-mini/mini.align'),
  Gh('nvim-mini/mini.bracketed'),
  Gh('nvim-mini/mini.diff'),
  Gh('nvim-mini/mini-git'),
  Gh('nvim-mini/mini.icons'),
  Gh('nvim-mini/mini.jump'),
  Gh('nvim-mini/mini.move'),
  Gh('nvim-mini/mini.pairs'),
  Gh('nvim-mini/mini.surround'),
  -- Gh('nvim-mini/mini.clue'),
})

require('mini.ai').setup()
require('mini.align').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.jump').setup({ silent = true  })
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup({ respect_selection_type = true, silent = true })
require('mini.bracketed').setup({
  buffer     = { suffix = 'b', options = {} },
  comment    = { suffix = 'c', options = {} },
  conflict   = { suffix = 'x', options = {} },
  diagnostic = { suffix = 'd', options = {} },
  file       = { suffix = 'f', options = {} },
  indent     = { suffix = 'i', options = {} },
  jump       = { suffix = 'j', options = {} },
  location   = { suffix = 'l', options = {} },
  oldfile    = { suffix = 'o', options = {} },
  quickfix   = { suffix = 'q', options = {} },
  treesitter = { suffix = '', options = {} },
})
