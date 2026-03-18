vim.pack.add({ Gh("nvim-lualine/lualine.nvim") })

local custom_onedark = require("lualine.themes.onedark")
custom_onedark.normal.c.bg = "#282C34"

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = custom_onedark,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = {}, winbar = {} },
    ignore_focus = { "undotree" },
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
      -- might remove, i'll test for a bit
    lualine_b = { { "project", format = 'short', no_project = nil, } },
    lualine_c = {
      "branch",
      {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = "#98C379" },
          modified = { fg = "#D19A66" },
          removed = { fg = "#E06C75" },
        },
      },
      "filename",
    },

    lualine_x = {
      "lsp_status",
      "diagnostics",
      "filetype",
      -- leaving just in case I add noice back for some reason
      -- {
      --   require("noice").api.status.mode.get,
      --   cond = require("noice").api.status.mode.has,
      --   color = { fg = "#E06C75" },
      -- },
    },
    lualine_y = {},
    lualine_z = {},
  },

  -- not sure I need delete if nothing seems to happen from commenting out
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { "filename" },
  --   lualine_x = { "location" },
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
})
