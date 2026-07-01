vim.pack.add({ Gh("folke/zen-mode.nvim") })
vim.pack.add({ Gh("folke/twilight.nvim") })

require("zen-mode").setup({
  window = {
    backdrop = 1,
    width = .85,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      foldcolumn = "0",
    },
  },
  plugins = {
    options = {
      ruler = true,
      laststatus = 0,
    },
    todo = { enabled = true },
    kitty = { 
      enabled = true,
      font = "+4", -- font size increment
    },
    neovide = {
      enabled = true,
      scale = 1.0,
    }
  },

  on_open = function(win)
    vim.diagnostic.config({ virtual_text = false })
  end,
  on_close = function()
    vim.diagnostic.config({ virtual_text = true })
  end,
})

vim.keymap.set('n', "<leader>tz", "<cmd>:ZenMode<CR>", { desc = "Toggle ZenMode" })
