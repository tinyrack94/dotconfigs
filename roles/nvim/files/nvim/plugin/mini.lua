-- neovim 기본 설정 변경
require("mini.basics").setup({})

-- 주석 지원
require("mini.comment").setup({})

-- 괄호 자동 닫기 제공
require("mini.pairs").setup({})

-- 코드 이동 지원
require("mini.move").setup({})

-- 코드 자동 완성 제공
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
    gen_loader.from_file("~/.config/nvim/snippets/global.json"),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})
require("mini.completion").setup({})

-- 객체 쪼개기/나누기 지원
require("mini.splitjoin").setup({})

-- bracket 단위 이동 지원
require("mini.bracketed").setup({})

-- 버퍼 제거 시 레이아웃 유지
require("mini.bufremove").setup({})

-- git diff
local diff = require("mini.diff")
diff.setup({
  source = diff.gen_source.none(),
})

-- buffer 내에서 파일 브라우징
local mini_files = require("mini.files")
mini_files.setup({})
vim.keymap.set("n", "<leader>fo", mini_files.open, { desc = "Open Files" })
vim.keymap.set("n", "<leader>fc", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  MiniFiles.open(path)
  MiniFiles.reveal_cwd()
end, { desc = "Open Files (Current Path)" })

-- 유용한 도구 모음
require("mini.extra").setup({})

-- vim 명령어에서 git 지원
require("mini.git").setup({})

-- f, F, t, T 점프 지원
require("mini.jump").setup({})

-- 보이는 내에서 이동 지원
require("mini.jump2d").setup({})

-- Pick 창 지원
require("mini.pick").setup({})

-- 방문 히스토리 지원
require("mini.visits").setup({})

------------------------------ appearance

-- icon 팩
require("mini.icons").setup({})

-- local animate = require('mini.animate')
-- -- animation 지원
-- animate.setup({
--   scroll = {
--     enable = false,
--   },
-- })

-- 테마 지원
--
-- require('mini.base16').setup({
--   palette = "bas00"
-- })

-- cursor 위치 단어 highlight
require("mini.cursorword").setup({})

-- text pattern highlight
require("mini.hipatterns").setup({})

-- text pattern highlight
require("mini.indentscope").setup({})

-- -- 미니맵 지원
-- require("mini.map").setup({})

-- 알림 지원
require("mini.notify").setup({})

-- 시작 화면 지원
require("mini.starter").setup({})

-- 상태 표시줄 지원
require("mini.statusline").setup({})

-- buffer 탭 지원
require("mini.tabline").setup({})

-- trailspace 표시 지원
require("mini.trailspace").setup({})

-- session 개념 지원
require("mini.sessions").setup({
  directory = vim.fn.stdpath("config") .. "/sessions",
  autowrite = true,
  autoread = true,
})

-- others
require("mini.fuzzy").setup({})
