vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- was in plugins/snacks can't remember what it was for
--
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'MiniFilesActionRename',
--   callback = function(event)
--     Snacks.rename.on_rename_file(event.data.from, event.data.to)
--   end,
-- })

-- codelens none of the lsp's I use have this
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client:supports_method("textDocument/codeLens") then
--       vim.lsp.codelens.refresh()
--       vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
--         buffer = bufnr,
--         callback = vim.lsp.codelens.refresh,
--       })
--     end
--   end,
-- })
