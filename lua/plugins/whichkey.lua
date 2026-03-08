vim.pack.add({ Gh("folke/which-key.nvim") })

require("which-key").setup({
  preset = "classic",
  triggers = {
    { "<leader>", mode = { "n", "v" } },
    { "\\",       mode = { "n", "v" } },
    { "<C-w>",    mode = { "n", "v" } },
    { "z",        mode = { "n", "v" } },
    { "g",        mode = { "n", "v" } },
  },
  icons = {
    breadcrumb = "+",
    separator = " ",
    group = "",
    mappings = true,
    colors = false,
    keys = { BS = "bkspace =", Esc = "esc =" },
  },
  win = {
    no_overlap = false,
    border = "single",
    padding = { 0, 2 },
    wo = { winblend = 0 },
  },
  layout = { spacing = 10 },
  keys = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
  show_help = false,
  show_keys = false,
  plugins = {
    spelling = { enabled = true },
    presets = {
      operators = true,
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
})
