vim.pack.add({ Gh('DrKJeff16/project.nvim') })
-- https://github.com/DrKJeff16/project.nvim

require('project').setup({
  snacks = {
    enabled = true,
    enable_autochdir = true,
  }
})
