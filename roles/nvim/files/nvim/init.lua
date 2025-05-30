-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later


------

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 대소문자 구분 없이 커맨드 자동완성 지원
vim.o.ignorecase = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3

vim.opt.expandtab = true -- 탭 키를 누르면 스페이스로 변환
vim.opt.tabstop = 2      -- 탭 하나의 너비를 스페이스 4개로 설정
vim.opt.shiftwidth = 2   -- 자동 들여쓰기 시 스페이스 4개 사용
vim.opt.softtabstop = 2  -- 백스페이스나 탭을 누를 때 스페이스 4개 단위로 이동 (선택 사항)

----------------------------------------------------- treesitter

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

------------------------------------------------------- lsp

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

----- telescope

-- add({
--   source = 'nvim-telescope/telescope.nvim',
--   depends = { 'nvim-lua/plenary.nvim' },
-- })

---------------------------------------------------- theme
add({
  source = "folke/tokyonight.nvim",
})
require("tokyonight").setup({})
vim.cmd.colorscheme "tokyonight-night"

---- trouble

add({
  source = "folke/trouble.nvim",
})
require("trouble").setup({})

-- 키맵 설정
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Diagnostics (Trouble)" }))
vim.keymap.set("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics (Trouble)" }))
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",
  vim.tbl_extend("force", opts, { desc = "Symbols (Trouble)" }))
vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  vim.tbl_extend("force", opts, { desc = "LSP Definitions / references / ... (Trouble)" }))
vim.keymap.set("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Location List (Trouble)" }))
vim.keymap.set("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Quickfix List (Trouble)" }))

--------------------------------------------------------- mini

now(function()
  -- 주석 지원
  require('mini.comment').setup({});

  -- 괄호 자동 닫기 제공
  require('mini.pairs').setup({});

  -- 코드 이동 지원
  require('mini.move').setup({});

  -- 코드 자동 완성 제공
  require('mini.completion').setup({});

  -- 객체 쪼개기/나누기 지원
  require('mini.splitjoin').setup({});

  -- 스마트 단축키 지원
  local keymap = require('mini.keymap')
  local map_multistep = keymap.map_multistep
  map_multistep('i', '<Tab>', { 'pmenu_next' })
  map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
  map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  map_multistep('i', '<BS>', { 'minipairs_bs' })
  local map_combo = keymap.map_combo
  -- Support most common modes. This can also contain 't', but would
  -- only mean to press `<Esc>` inside terminal.
  local mode = { 'i', 'c', 'x', 's' }
  map_combo(mode, 'jk', '<BS><BS><Esc>')
  -- To not have to worry about the order of keys, also map "kj"
  map_combo(mode, 'kj', '<BS><BS><Esc>')
  -- Escape into Normal mode from Terminal mode
  map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
  map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

  -- 명령어 도움말 제공
  local miniclue = require('mini.clue')
  miniclue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),

      -- 그룹명 지정
      { mode = 'n', keys = '<Leader>a',  desc = '+AI' },
      { mode = 'n', keys = '<Leader>p',  desc = '+Pick' },
      { mode = 'n', keys = '<Leader>f',  desc = '+Files' },
      { mode = 'n', keys = '<Leader>l',  desc = '+LSP' },
      { mode = 'n', keys = '<Leader>lg', desc = '+Go to' },
      { mode = 'n', keys = '<Leader>t',  desc = '+Troubles' },
    },
  });


  --- General Workflow ---

  -- neovim 기본 설정 변경
  require('mini.basics').setup({})

  -- bracket 단위 이동 지원
  require('mini.bracketed').setup({})

  -- 버퍼 제거 시 레이아웃 유지
  require('mini.bufremove').setup({})

  -- git diff
  require('mini.diff').setup({})

  -- buffer 내에서 파일 브라우징
  local mini_files = require('mini.files')
  mini_files.setup({})
  vim.keymap.set('n', '<leader>fo', mini_files.open, { desc = "Open Files" })
  vim.keymap.set(
    'n',
    '<leader>fc',
    function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end,
    { desc = "Open Files (Current Path)" }
  )

  -- 유용한 도구 모음
  require('mini.extra').setup({})

  -- vim 명령어에서 git 지원
  require('mini.git').setup({})

  -- f, F, t, T 점프 지원
  require('mini.jump').setup({})

  -- 보이는 내에서 이동 지원
  require('mini.jump2d').setup({})

  -- Pick 창 지원
  require('mini.pick').setup({})
  vim.keymap.set('n', '<leader>pf', '<cmd>Pick files<cr>', { desc = "Files" })
  vim.keymap.set('n', '<leader>pg', '<cmd>Pick grep_live<cr>', { desc = "Grep" })
  vim.keymap.set('n', '<leader>pb', '<cmd>Pick buffers<cr>', { desc = "Buffers" })

  -- 방문 히스토리 지원
  require('mini.visits').setup({})

  ------------------------------ appearance

  -- icon 팩
  require('mini.icons').setup({})

  -- animation 지원
  -- require('mini.animate').setup({})

  -- cursor 위치 단어 highlight
  require('mini.cursorword').setup({})

  -- text pattern highlight
  require('mini.hipatterns').setup({})

  -- text pattern highlight
  require('mini.indentscope').setup({})

  -- 미니맵 지원
  require('mini.map').setup({})

  -- 알림 지원
  require('mini.notify').setup({})

  -- 시작 화면 지원
  require('mini.starter').setup({})

  -- 상태 표시줄 지원
  require('mini.statusline').setup({})

  -- buffer 탭 지원
  require('mini.tabline').setup({})

  -- trailspace 표시 지원
  require('mini.trailspace').setup({})

  -- session 개념 지원
  -- require('mini.sessions').setup({})

  -- others
  require('mini.fuzzy').setup({})
end)
