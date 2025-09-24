let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +75 plugin/cmp.lua
badd +8 plugin/markdown.lua
badd +1 plugin/trouble.lua
badd +9 plugin/treesitter.lua
badd +1 plugin/ai.lua
badd +1 ~/.config/nvim/plugin/lsp.lua
badd +15 ~/.config/nvim/plugin/theme.lua
badd +1 plugin/git.lua
badd +1 health://
badd +24 ~/.config/nvim/plugin/mini.lua
badd +1 mini-deps-snap
badd +4 init.lua
badd +3 .gitignore
badd +76 /home/linuxbrew/.linuxbrew/Cellar/neovim/0.11.4/share/nvim/runtime/lua/vim/keymap.lua
badd +1 plugin/configs.lua
badd +2 plugin/keymap.lua
argglobal
%argdel
edit ~/.config/nvim/plugin/mini.lua
argglobal
balt plugin/keymap.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 27 - ((23 * winheight(0) + 38) / 76)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 012|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
