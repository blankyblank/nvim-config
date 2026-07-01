vim.pack.add({ Gh("ibhagwan/fzf-lua") })

require('fzf-lua').setup{
  winopts = {
    preview = { scrollbar = false, },
    height = 0.90,
    width = 0.94,
    row = 0.50,
  },
  fzf_opts = {
    ["--cycle"] = true,
  },
  preview = {
    wrap = true,
  },
  files = {
    cwd_prompt = false,
    no_ignore = true,
  },
}

-- require('fzf-lua').setup {
--   { "ivy", "borderless-full" },
--   winopts = {
--     preview = { scrollbar = false }
--   },
--   files = {
--     cwd_prompt = false,
--     no_ignore = true
--   }
-- }
