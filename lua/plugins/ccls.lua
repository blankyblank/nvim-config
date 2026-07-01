vim.pack.add({
  Gh("ranjithshegde/ccls.nvim"),
  Gh("oribarilan/lensline.nvim")
})

local cpu_count = #vim.uv.cpu_info()
local ccls_threads = math.max(1, cpu_count - 1)

local server_config = {
  cmd = { 'ccls', '--log-file=/tmp/ccls.log', '--v=0' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'opencl' },
  init_options = {
    threads = ccls_threads,
    index = {
      trackDependency = 1,
      blacklist = { '^build/', '^.cache/', '^bin/', '^packaging', '^res' }
    },
    cache = {
      directory = '.ccls-cache'
    }
  }
}

require('ccls').setup {
  lsp = {
    server = server_config,
    disable_capabilities = {
      completionProvider = true,
      documentFormattingProvider = true,
      definitionProvider = true,
      documentRangeFormattingProvider = true,
      documentHighlightProvider = false,
      documentSymbolProvider = true,
      hoverProvider = true,
      referencesProvider = true,
      renameProvider = true,
      typeDefinitionProvider = true,
      workspaceSymbolProvider = true
    },
    disable_diagnostics = true,
    disable_signature = true,
    codelens = { enable = false }
  }
}


lensconf = {
  profiles = {
    {
      name = "default",
      providers = { -- Array format: order determines display sequence
        {
          name = "usages",
          enabled = true,            -- enable usages provider by default (replaces references)
          include = { "refs", "defs" },      -- refs-only setup to match references provider behavior
          breakdown = true,          -- false = aggregate count, true = breakdown by type
          show_zero = true,          -- show zero counts when LSP supports the capability
        },
        {
          name = "diagnostics",
          enabled = false,    -- Must be explicitly enabled
          min_level = "WARN" -- Only show errors
        },
        {
          name = "complexity",
          enabled = true,
          min_level = "L" -- only show L and XL complexity (default)
        },
        {
          name = "last_author",
          enabled = false -- enabled by default with caching optimization
        }
      },
      style = {
        placement = "inline",  -- "above" | "inline" - where to render lenses (consider prefix = "" for inline)
        render = "all"     -- "all" | "focused" (only active window's focused function)
      }
    }
  },
  limits = {
    exclude_gitignored = true, -- respect .gitignore by not processing ignored files
    max_lines = 1000,          -- process only first N lines of large files
    max_lenses = 400            -- skip rendering if too many lenses generated
  },
  debounce_ms = 200,         -- unified debounce delay for all providers
  focused_debounce_ms = 150, -- debounce delay for focus tracking in focused mode
  silence_lsp = true,        -- suppress noisy LSP log messages (e.g., Pyright reference spam)
  debug_mode = false         -- enable debug output for development, see CONTRIBUTE.md
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Disable semantic highlighting only for ccls
    if client and client.name == "ccls" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost', 'LspAttach' }, {
  callback = function ()
    if not _G.lensline_setup_done then
      require("lensline").setup(lensconf)
      _G.lensline_setup_done = true
    end
  end
})
