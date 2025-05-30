local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
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
    { name = "codeium" },
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
