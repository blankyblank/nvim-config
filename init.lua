autocmd = vim.api.nvim_create_autocmd
vim.have_nerd_font = true
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.autoformat = true

-- disable loading plugins for performance
vim.g.loaded_2html_plugin = true
vim.g.loaded_bugreport = 1
vim.g.loaded_compiler = 1
vim.g.loaded_ftplugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_logipat = 1
-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_optwin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = true
vim.g.loaded_synmenu = 1
vim.g.loaded_syntax = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

require("config.hooks")
require("plugins")
require("config")
-- vim.cmd([[let &packpath = &runtimepath]])

if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.0
  vim.g.neovide_scroll_animation_length = 0.0
  vim.g.neovide_progress_bar_enabled = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_trail_size = 1.0
  local function copy() vim.cmd([[normal! "+y]]) end
  local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end
  vim.keymap.set("v", "<S-C-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<S-C-v>", paste, { silent = true, desc = "Paste" })
  vim.opt.termguicolors = true
end

vim.filetype.add({
  extension = {
    h = function(path, bufnr)
      -- Only set to cpp if it includes a C++ header (e.g., <vector>, <string>)
      if vim.fn.search([[^#include\s*<[^>.]+>]], "nw", bufnr) > 0 then
        return "cpp"
      end
      return "c"
    end,
  },
})
