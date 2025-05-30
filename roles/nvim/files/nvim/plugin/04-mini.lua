local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  -- 주석 지원
  require('mini.comment').setup({});

  -- 괄호 자동 닫기 제공
  require('mini.pairs').setup({});

  -- 코드 이동 지원
  require('mini.move').setup({});

  -- 코드 자동 완성 제공
  -- require('mini.completion').setup({});

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
      -- { mode = 'n', keys = '<Leader>a',  desc = '+AI' },
      { mode = 'n', keys = '<Leader>p',  desc = '+Pick' },
      { mode = 'n', keys = '<Leader>f',  desc = '+Files' },
      { mode = 'n', keys = '<Leader>l',  desc = '+LSP' },
      { mode = 'n', keys = '<Leader>lg', desc = '+Go to' },
      { mode = 'n', keys = '<Leader>t',  desc = '+Troubles' },
      { mode = 'n', keys = '<Leader>c',  desc = '+CodeCompanion' },
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
  local diff = require('mini.diff')
  diff.setup({
    source = diff.gen_source.none(),
  })

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
  require('mini.sessions').setup({})

  -- others
  require('mini.fuzzy').setup({})
end)
