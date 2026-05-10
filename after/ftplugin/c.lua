set.makeprg = "make"
vim.cmd("compiler gcc")

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
  end,
})

-- vim.opt_local.formatoptions:remove('t') -- Remove auto-wrap
-- vim.opt_local.formatoptions = "croql"
-- vim.opt_local.suffixesadd = { '.h' }

vim.api.nvim_buf_create_user_command(0, "Clean", function()
  vim.cmd("make clean")
  vim.cmd("make")
end, { nargs = 0, desc = 'run make clean, then make' })

vim.bo.commentstring = "/* %s */"
