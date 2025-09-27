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
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +12 plugin/keymap.lua
badd +1 plugin/lsp.lua
badd +6 ~/.config/nvim/plugin/mini.lua
badd +15 plugin/config.lua
badd +1 plugin/format.lua
badd +2 plugin/theme.lua
badd +4 init.lua
badd +6 plugin/treesitter.lua
badd +8 plugin/lint.lua
badd +1 ~/.config/nvim/plugin/snippets.lua
badd +4 .vscode/settings.json
badd +25 plugin/explorer.lua
badd +114 health://
badd +21 plugin/completion.lua
badd +5 plugin/copilot.lua
badd +4 plugin/icons.lua
badd +9 plugin/flash.lua
badd +8 plugin/git.lua
badd +8 plugin/comment.lua
argglobal
%argdel
edit plugin/comment.lua
argglobal
balt ~/.config/nvim/plugin/mini.lua
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
let s:l = 8 - ((7 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
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
