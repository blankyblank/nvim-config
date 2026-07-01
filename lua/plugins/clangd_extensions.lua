vim.pack.add({ Gh("p00f/clangd_extensions.nvim") })

require("clangd_extensions").setup({
  autoSetHints = true,
  ast = {
    --These require codicons (https://github.com/microsoft/vscode-codicons)
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },
    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  },
})



-- cmp relies on clangd_extensions
-- WARN: if I remove clangd_extensions I need to remember to put this back in init.lua
require('plugins.nvim-cmp')
