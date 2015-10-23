" vim:fdm=marker:
se nocp

" plugins {{{
call plug#begin('~/.vim.plugged')
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Smart-Tabs'
Plug 'brookhong/cscope.vim'
Plug 'peaksea'
Plug 'scrooloose/nerdtree'
Plug 'vim-perl/vim-perl', { 'do': 'make clean carp highlight-all-pragmas' }
call plug#end()
" }}}

filetype plugin indent on
syntax on

" options {{{
se ts=4
se sw=4
se ai
se nojoinspaces
se tw=80
se formatoptions+=j

se nowrap
se laststatus=2
se showcmd
se wmnu
se wim=list:longest,full
se nu
se rnu
se cursorline
se hls
se incsearch
se foldlevelstart=99

se ml
se hi=1000
se lazyredraw
se autoread
se mouse=a
" }}}

" variables {{{
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1

let perl_fold=1
let xml_syntax_folding=1

let LatexBox_viewer='zathura'
let LatexBox_quickfix=2
" }}}

" keys {{{
let mapleader='\'

se <S-F1>=[1;2P
se <S-F2>=[1;2Q
se <S-F3>=[1;2R
se <S-F4>=[1;2S

ino <C-h> <C-o>h
ino <C-l> <C-o>a
ino <C-j> <C-o>j
ino <C-k> <C-o>k

nn  <F4> :se rnu!<CR>
nn  <Leader>w :se wrap!<CR>
nn  <Leader>s :se list!<CR>

nn  <F3> :noh<CR>
nn  <silent> <Esc>u :noh<CR>
nn  <C-n> :let v:hlsearch=1 \| let @/=expand("<cword>")<CR>

nn  <C-s> :update<CR>
im  <C-s> <C-o><C-s>
nn  \\ :e<CR>
nn  <Leader>d :lcd %:p:h<CR>:pwd<CR>

nn  <C-h> <C-W>h
nn  <C-j> <C-W>j
nn  <C-k> <C-W>k
nn  <C-l> <C-W>l

nn  <F5> :bp<CR>
nn  <F6> :bn<CR>
nn  <F2> :ls<CR>:b 

nn  <C-PageUp> gT
nn  <C-PageDown> gt
nn  <Leader>t :tabnew 

nn  <S-F7> :cp<CR>
nn  <S-F8> :cn<CR>

nn  <Space>p "*p
nn  <Space>o "+p
im  <F5>    <C-o><Space>p
im  <S-F5>  <C-o><Space>o

nn  <F9> :make<CR>

nn  < <<
nn  > >>
vn  > >gv
vn  < <gv

nn  <F1> :NERDTreeToggle<CR>
nn  <S-F1> :exe 'NERDTree' getcwd()<CR>
nn  <Leader>f :NERDTreeFind<CR>

nn  <silent> <Leader>a :let &mouse= !empty(&mouse) ? '' : 'a'<CR>
" }}}

com! -bar SudoW sil exe "w !sudo tee % >/dev/null" | sil e!

" colorz {{{
se t_Co=256
se bg=dark
color peaksea
hi Normal ctermfg=252 ctermbg=NONE cterm=NONE
hi NonText ctermfg=18 ctermbg=NONE cterm=NONE
hi CursorLine ctermbg=234 cterm=NONE
" }}}

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif