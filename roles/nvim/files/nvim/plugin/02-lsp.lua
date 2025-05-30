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

-- mini.deps를 사용하여 플러그인들을 추가합니다.
add({
  -- nvim-cmp 본체
  source = 'hrsh7th/nvim-cmp',
  depends = {
    'neovim/nvim-lspconfig',    -- LSP 연동을 위해 필요
    'hrsh7th/cmp-nvim-lsp',     -- LSP 소스
    'hrsh7th/cmp-buffer',       -- 버퍼 소스
    'hrsh7th/cmp-path',         -- 경로 소스
    'L3MON4D3/LuaSnip',         -- 스니펫 엔진
    'saadparwaiz1/cmp_luasnip', -- LuaSnip 소스
    'onsails/lspkind.nvim',     -- (선택 사항) 아이콘 표시 }
  }
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind') -- 선택 사항

-- nvim-cmp 설정
cmp.setup({
  snippet = {
    -- `luasnip`을 스니펫 엔진으로 사용
    expand = function(args)
      luasnip.expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({ -- 선택 사항: 아이콘 표시
      maxwidth = 50,
      ellipsis_char = '...',
      before = function(entry, vim_item)
        vim_item.menu = '(' .. entry.source.name .. ')'
        return vim_item
      end,
    }),
  },
})

-- cmdline 자동 완성 설정
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'buffer' }
  })
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

