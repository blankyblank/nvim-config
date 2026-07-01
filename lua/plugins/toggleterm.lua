vim.pack.add({ Gh('akinsho/toggleterm.nvim') })

require("toggleterm").setup({
  open_mapping = [[<c-\>]], -- or { [[<c-\>]],
  autochdir = false,
  shade_terminals = false,
})

vim.pack.add({ Gh('kdheepak/lazygit.nvim')})

