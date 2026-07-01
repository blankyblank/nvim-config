vim.pack.add({ Gh('j-hui/fidget.nvim') })
require('fidget').setup({
  option = {
    notification = {
      override_vim_notify = true,
      window = {
        avoid = {
          "NvimTree" }
      }
    }
  }
})
vim.notify = require("fidget.notification").notify
