local M = {}
vim.lsp.config('emmylua_ls', { settings = { Lua = { diagnostics = { globals = { "MiniSnippets" } } } } })
vim.lsp.enable('emmylua_ls')
vim.lsp.enable('bashls')
vim.lsp.enable('marksman')
vim.lsp.enable('clangd')

-- vim.lsp.enable('ccls')
-- vim.lsp.enable('c3_lsp')
-- vim.lsp.enable('hls')
-- vim.lsp.enable('gopls')

--[[ vim.api.nvim_create_autocmd({'BufEnter'}, {
 pattern = {"*.hl", "hypr*.conf",},
 callback = function(event)
   print(string.format("starting hyprls for %s", vim.inspect(event)))
   vim.lsp.start {
     name = "hyprlang",
     cmd = {"hyprls"},
     root_dir = vim.fn.getcwd(),
   }
 end
}) ]]

return M
