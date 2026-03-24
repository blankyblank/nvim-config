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

-- User Commands
vim.api.nvim_create_user_command("LaunchTermDebug", function()
  vim.ui.input({ prompt = 'Binary for debug session:' }, function(input)
    if input then
      vim.cmd("Termdebug" .. input)
    end
  end)
end, { nargs = 0, desc = 'start termdebug with a binary'})

vim.api.nvim_create_user_command("PackRemove", function()
  vim.ui.input({ prompt = 'Enter packages to remove: ' }, function(input)
    if input then
      vim.pack.del({ input })
    end
  end)
end, { nargs = 0, desc = 'delete plugins' })

vim.api.nvim_create_user_command('PackRemoveAllUnused', function()
  vim.pack.del(
  vim.iter(vim.pack.get())
  :filter(function(x) return not x.active end)
  :map(function(x) return x.spec.name end)
  :totable()
) end, { nargs = 0, desc = 'delete all inactive plugins' })

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
