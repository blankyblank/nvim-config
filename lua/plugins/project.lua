vim.pack.add({ Gh('DrKJeff16/project.nvim') })
-- https://github.com/DrKJeff16/project.nvim

require('plugins.fzf')

require('project').setup({
  enable_autochdir = true,
  fzf_lua = {
    enabled = true,
    show = 'names',
  }
})
