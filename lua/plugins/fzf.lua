vim.pack.add({ Gh("ibhagwan/fzf-lua") })

require('fzf-lua').setup {
  { "telescope", "max-perf" },
  -- { "max-perf", "borderless-full" },
--   { "ivy", "borderless-full" },
  winopts = {
    preview = { scrollbar = false },
    height = 0.90,
    width = 0.94,
    row = 0.50
  },
  fzf_opts = {
    ["--cycle"] = true,
    ["--layout"] = "reverse"
  },
  preview = {
    wrap = true
  },
  files = {
    cwd_prompt = false,
    no_ignore = true
  },
  git = {
    cwd_header = true
  },
  zoxide = {
    git_root = true
  }
}
