return {
  -- nvim-cmp: 자동 완성 코어
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',        -- Insert 모드 진입 시 로드
    dependencies = {
      'neovim/nvim-lspconfig',    -- LSP 연동을 위해 필요
      'hrsh7th/cmp-nvim-lsp',     -- LSP 소스
      'hrsh7th/cmp-buffer',       -- 버퍼 소스
      'hrsh7th/cmp-path',         -- 경로 소스
      'L3MON4D3/LuaSnip',         -- 스니펫 엔진
      'saadparwaiz1/cmp_luasnip', -- LuaSnip 소스
      'onsails/lspkind.nvim',     -- (선택 사항) 아이콘 표시
    },
    config = function()
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
          ['<C-Space>'] = cmp.mapping.complete(),            -- 자동 완성 수동 트리거
          ['<C-e>'] = cmp.mapping.abort(),                   -- 자동 완성 메뉴 닫기
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- 선택된 항목 확인 (Enter 키)
          -- Tab 키로 완성 제안 이동 및 스니펫 확장
          ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
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
        -- 자동 완성 메뉴가 자동으로 뜨도록 설정 (선택 사항)
        -- enabled = function()
        --   return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        -- end,
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

      -- LSP 설정 (nvim-lspconfig)
      -- LSP 서버 설정은 별도의 파일에 분리하는 것이 일반적입니다.
      -- 예를 들어, ~/.config/nvim/lua/config/lsp.lua

      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      -- LSP 서버 기능에 nvim-cmp의 capabilities를 추가하여 자동 완성 기능 활성화
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- 각 언어 서버 설정
      -- 예시: Python (pyright), Lua (lua_ls), TypeScript (tsserver)
      lspconfig.pyright.setup({
        capabilities = capabilities,
        -- 추가 설정 (예: root_dir, settings 등)
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        -- 추가 설정
      })

      -- 더 많은 LSP 서버를 추가할 수 있습니다.
      -- :h lspconfig-all-servers 명령으로 사용 가능한 서버 목록 확인
    end,
  },

  -- 추가 스니펫 팩 (선택 사항)
  {
    'rafamadriz/friendly-snippets',
    dependencies = { 'L3MON4D3/LuaSnip' },
  },
}
