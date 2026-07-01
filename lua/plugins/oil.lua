vim.pack.add({ Gh('stevearc/oil.nvim') })

require("oil").setup({
  skip_confirm_for_simple_edits = false,
  view_options = {
    show_hidden = true
  },
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return true
    end,
    mv = function(src_path, dest_path)
      return true
    end,
    rm = function(path)
      return true
    end,
  },
})
