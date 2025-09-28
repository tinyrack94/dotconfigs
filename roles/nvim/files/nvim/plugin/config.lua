vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 대소문자 구분 없이 커맨드 자동완성 지원
vim.o.ignorecase = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3

vim.opt.expandtab = true -- 탭 키를 누르면 스페이스로 변환
vim.opt.tabstop = 2 -- 탭 하나의 너비를 스페이스 4개로 설정
vim.opt.shiftwidth = 2 -- 자동 들여쓰기 시 스페이스 4개 사용
vim.opt.softtabstop = 2 -- 백스페이스나 탭을 누를 때 스페이스 4개 단위로 이동 (선택 사항)

vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search matters if capital letter
vim.opt.inccommand = "split" -- "for incsearch while sub
