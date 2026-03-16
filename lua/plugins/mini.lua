vim.pack.add({ Gh('nvim-mini/mini.nvim') })

require('mini.comment').setup({ options = { ignore_blank_line = true } })
require('mini.diff').setup()
require('mini.files').setup({ options = { use_as_default_explorer = true } })
require('mini.git').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.jump').setup({ options = { silent = true } })
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup({ respect_selection_type = true, silent = true })
require('mini.indentscope').setup({
  draw = {
    delay = 100,
    animation = require('mini.indentscope').gen_animation.none(),
  },
  options = { try_as_border = true },
  symbol = '│',
})

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    { mode = 'n',          keys = '[' },
    { mode = 'n',          keys = ']' },
    -- Built-in completion
    -- { mode = 'i',          keys = '<C-x>' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
    { mode = 'n',          keys = '<C-w>' },
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  window = {
    delay = 500,
    config = { width = "auto" },
      -- config = { anchor = 'SW', row = 'auto', col = 'auto' },
  },

  clues = {
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
    { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
    { mode = 'n', keys = '<Leader>c', desc = '+Code' },
    { mode = 'n', keys = '<Leader>d', desc = '+Diagnostics' },
    { mode = 'n', keys = '<Leader>f', desc = '+File' },
    { mode = 'n', keys = '<Leader>g', desc = '+Git' },
    { mode = 'n', keys = '<Leader>h', desc = '+Hel' },
    { mode = 'n', keys = '<Leader>m', desc = '+Manage' },
    { mode = 'n', keys = '<Leader>o', desc = '+Open' },
    { mode = 'n', keys = '<Leader>p', desc = '+Projects' },
    { mode = 'n', keys = '<Leader>s', desc = '+Search' },
    { mode = 'n', keys = '<Leader>t', desc = '+Toggle' },
  },
})


-- to use mini.completion ( needs more work still )
-- local gen_loader = require('mini.snippets').gen_loader
-- require('mini.snippets').setup({
--   snippets = {
--     gen_loader.from_lang(), -- This includes those defined by friendly-snippets.
--   },
--   mappings = {
--     jump_next = '<Tab>',
--     jump_prev = '<S-Tab>',
--   },
-- })
-- require('mini.completion').setup()
