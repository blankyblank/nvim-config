set.makeprg = "make"
vim.cmd("compiler gcc")

-- vim.lsp.config("clangd", {
--   -- on_attach = function(client, bufnr)
--   --   require("inlay-hints").on_attach(client, bufnr)
--   -- end,
-- })

vim.bo.commentstring = "/* %s */"
