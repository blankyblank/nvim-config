local M = {}
-- NOTE: put hooks in this that need to run early.

-- to install jsregexp for LuaSnip
local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({'make', 'install_jsregexp'}, { cwd = ev.data.path }):wait()
    end
end
vim.api.nvim_create_autocmd('PackChanged', {callback = hooks})
return M
