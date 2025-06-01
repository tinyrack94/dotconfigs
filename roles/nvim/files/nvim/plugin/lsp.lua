local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- neovim development environment
later(function()
  add({
    source = 'folke/lazydev.nvim',
  })

  require('lazydev').setup({
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "MiniDeps",           words = { "MiniDeps" } },
      "nvim-dap-ui"
    },
  })
end)

later(function()
  add({
    source = 'williamboman/mason-lspconfig.nvim',
    depends = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
  })

  require('mason').setup({});
  require('mason-lspconfig').setup({});

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {
        buffer = ev.buf,
        desc = "Open diagnostics"
      })

      vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, {
        buffer = ev.buf,
        desc = "Go to declaration"
      })

      vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, {
        buffer = ev.buf,
        desc = "Go to definition"
      })

      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, {
        buffer = ev.buf,
        desc = "Rename"
      })

      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {
        buffer = ev.buf,
        desc = "Format Codes"
      })

      vim.keymap.set('n', '<leader>le', '<cmd>LspEslintFixAll<CR>', {
        buffer = ev.buf,
        desc = "Eslint fix all"
      })

      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {
        buffer = ev.buf,
        desc = "Code Actions"
      })

      vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, {
        buffer = ev.buf,
        desc = "References"
      })

      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {
        buffer = ev.buf,
        desc = "Signature Help"
      })
    end,
  })
end)
