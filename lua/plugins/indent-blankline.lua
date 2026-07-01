vim.pack.add({ Gh('lukas-reineke/indent-blankline.nvim') })
vim.pack.add({ Gh('rrethy/vim-illuminate') })

require('illuminate').configure()

local highlight = {
  "mypurple"
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "myblue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "mypurple", { fg = "#C678DD" })
end)

require("ibl").setup({
  indent = {
    char = '▏'
  },
  scope = {
    enabled = true,
    -- show_exact_scope = true,
    highlight = highlight,
  }
})
