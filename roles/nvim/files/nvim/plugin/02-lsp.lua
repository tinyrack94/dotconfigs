local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

-- Possible to immediately execute code which depends on the added plugin
require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = { enable = true },
})

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

    -- wk.add({
    --   {
    --     "<leader>lg",
    --     group = "Go To",
    --   }
    -- })
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

    -- vim.keymap.set('n', '<leader>le', '<cmd>LspEslintFixAll<CR>', {
    --   buffer = ev.buf,
    --   desc = "Eslint fix all"
    -- })

    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {
      buffer = ev.buf,
      desc = "Code Actions"
    })

    vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, {
      buffer = ev.buf,
      desc = "References"
    })

    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

