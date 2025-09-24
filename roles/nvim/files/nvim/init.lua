vim.pack.add({
  'https://github.com/echasnovski/mini.nvim'
})

-- if not vim.loop.fs_stat(mini_path) then
--   vim.cmd('echo "Installing `mini.nvim`" | redraw')
--   local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
--   vim.fn.system(clone_cmd)
--   vim.cmd('packadd mini.nvim | helptags ALL')
--   vim.cmd('echo "Installed `mini.nvim`" | redraw')
-- end

-- Set up 'mini.deps' immediately to have its `now()` and `later()` helpers
require('mini.deps').setup()
