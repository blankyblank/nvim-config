vim.pack.add({ Gh("numToStr/Comment.nvim") })

-- NOTE:
--      this setup is so comment.nvim only loads on files that will have a
--      proper commentstring set up. otherwise gc won't work on those files,
--      but neovims builtin gc will still work.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    local ft = event.match
    local lang = vim.treesitter.language.get_lang(ft) or ft

    if vim.treesitter.language.add(lang) then
      local commentstring = vim.api.nvim_get_option_value('commentstring', { buf = event.buf })
      if commentstring and commentstring ~= 'xx %s' then
        require('Comment').setup()
      end
    end
  end,
})

-- -- require('Comment').setup()
