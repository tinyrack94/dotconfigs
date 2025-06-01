local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  -- tely execute code which depends on the added plugin
  require('nvim-treesitter.configs').setup({
    -- ensure_installed = 'all',
    auto_install = true,
    highlight = { enable = true },
  })
end)
