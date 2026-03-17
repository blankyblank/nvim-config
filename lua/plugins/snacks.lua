vim.pack.add({ Gh('folke/snacks.nvim') })

local Snacks = require('snacks')
require('snacks').setup({
  animate = { enabled = false },
  bigfile = { enabled = true },
  debug = { enabled = true },
  explorer = { enabled = true, replace_netrw = false },
  input = { enabled = true, backdrop = true },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = false, blocks = { enabled = true } },
  scratch = { minimal = true },
  scroll = { enabled = false },
  words = { enabled = true },
  zen = { toggles = { line_number = false, diagnostics = false, inlay_hints = false, } },


  picker = {
    enabled = true,
    cwd_bonus = true,
    formatters = {},
    icons = { files = { enabled = false } },
    layout = { preview = "main", preset = "ivy", },
  },

  terminal = {
    enabled = true,
    keys = {
      q = 'hide',
      gf = function(self)
        local f = vim.fn.findfile(vim.fn.expand('<cfile>'), '**')
        if f == '' then
          Snacks.notify.warn('No file under cursor')
        else
          self:hide()
          vim.schedule(function()
            vim.cmd('e ' .. f)
          end)
        end
      end,
    },
  },

  dashboard = {
    enabled = true, padding = 4, indent = 2,
    sections = {
      { section = "header" },
      -- { section = "keys", gap = 1, padding = 1 },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')", padding = 1, indent = 2 },
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')", padding = 1, indent = 2 },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert", padding = 1, indent = 2 },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')", padding = 1, indent = 2 },
      { icon = " ", key = "p", desc = "Open Project", action = ":NeovimProjectHistory", padding = 1, indent = 2 },
      { icon = " ", key = "P", desc = "Open Last Project", action = ":NeovimProjectLoadRecent", padding = 1, indent = 2 },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", padding = 1, indent = 2 },
      {
        icon = " ",
        key = "h",
        desc = "Find Documentation",
        padding = 1,
        indent = 2,
        action = function()
          Snacks.picker.help({
            confirm = function(picker, item)
              picker:action("jump")
            end
          })
        end,
      },
      { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1, indent = 2 },
    },
  },

  -- statuscolumn = {
  --   enabled = false,
  --   left = { 'git', 'sign' }, right = { '', '' },
  --   folds = { open = false, git_hl = false },
  --   git = { patterns = { 'GitSign', 'MiniDiffSign' } },
  --   refresh = 50, -- refresh at most every 50ms
  -- },
  -- indent = {
  --   enabled = false,
  --   only_scope = true,
  --   animate = { enabled = false },
  --   scope = {
  --     enabled = true,
  --     only_current = true,
  --   },
  -- },
})

vim.api.nvim_create_autocmd('User', {
  callback = function()
    _G.dd = function(...)
      Snacks.debug.inspect(...)
    end
    _G.bt = function()
      Snacks.debug.backtrace()
    end
    if vim.fn.has('nvim-0.11') == 1 then -- Override print to use snacks for `:=` command
      vim._print = function(_, ...)
        dd(...)
      end
    else
      vim.print = _G.dd
    end

    Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>ts')
    Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>tw')
    Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>tL')
    Snacks.toggle.diagnostics():map('<leader>td')
    Snacks.toggle.line_number():map('<leader>tl')
    Snacks.toggle.treesitter():map('<leader>tT')
    Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>tb')
    Snacks.toggle.inlay_hints():map('<leader>th')
    Snacks.toggle.indent():map('<leader>tg')
    Snacks.toggle.dim():map('<leader>tD')
    Snacks.toggle.zen():map('<leader>tz')
    Snacks.toggle.zoom():map('<leader>tZ')
    Snacks.toggle.option('conceallevel',
      { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>tc')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "SnacksDashboardOpened",
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})
