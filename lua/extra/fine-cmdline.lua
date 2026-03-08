vim.pack.add({
  Gh("VonHeikemen/fine-cmdline.nvim"),
  Gh('MunifTanjim/nui.nvim'),
})


vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
