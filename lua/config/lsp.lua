local M = {}
vim.lsp.config('emmylua_ls', { settings = { Lua = { diagnostics = { globals = { "MiniSnippets" } } } } })
vim.lsp.enable('emmylua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('bashls')
vim.lsp.enable('gopls')
vim.lsp.enable('marksman')
vim.lsp.enable('c3_lsp')

return M
