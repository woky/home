" vim:fdm=marker:
se nocp

if has("win32")
	se rtp+=$HOME/.vim
endif

" plugins {{{
call plug#begin('~/.vim.plugged')
" look & feel {{{
Plug 'vim-scripts/peaksea'
Plug 'mhartington/oceanic-next'
" }}}
" general {{{
Plug 'vim-utils/vim-husk'
Plug 'google/vim-searchindex'
"Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'lyuts/vim-rtags'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug '~/src/fzf'
"Plug 'embear/vim-localvimrc'
"Plug 'easymotion/vim-easymotion'
"Plug 'skroll/Smart-Tabs'
"Plug 'vim-scripts/vis'
" }}}
" languages {{{
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'
Plug 'neoclide/vim-jsx-improve'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-perl/vim-perl', { 'do': 'make clean carp highlight-all-pragmas' }
Plug 'rust-lang/rust.vim'
"Plug 'brookhong/cscope.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'google/vim-jsonnet'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-eunuch'
Plug 'pearofducks/ansible-vim'
" }}}
call plug#end()
" }}}

filetype plugin indent on
syntax on

ru! ftplugin/man.vim

" options {{{
se ts=4
se sw=4
se ai
se shiftround " sr
se nojoinspaces
se tw=80
se formatoptions+=j
se backspace=2
se whichwrap+=h,l,<,>,[,]

se nowrap
se laststatus=2
se showcmd
se shortmess=aI
se wmnu
se wim=list:longest,full
se nu
se rnu
se cursorline
se hls
se incsearch
se foldlevelstart=99
se splitbelow
se splitright

se ml
se hi=1000
se lazyredraw
se autoread
se mouse=a
" }}}

" variables {{{
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeMouseMode=3

let perl_fold=1
let xml_syntax_folding=1

let vimtex_quickfix_open_on_warning=0

let g:ackprg='rg --vimgrep'

let g:lightline = {
\	'component': {
\		'lineinfo': "%3l:%-2v/%{line('$')}",
\	},
\}
" }}}

let g:jsonnet_fmt_on_save = 0

" keys {{{
let mapleader='\'
nm , \

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
nn  <leader>q :q<CR>
nn  <leader>wq :x<CR>

nn  <C-h> <C-W>h
nn  <C-j> <C-W>j
nn  <C-k> <C-W>k
nn  <C-l> <C-W>l

nn <F5>       :bp<CR>
nn <F6>       :bn<CR>
nn <F2>       :Buffers<CR>
nn <leader>xx :hide<cr>
nn <leader>xs :bd<cr>

nn  <C-PageUp> gT
nn  <C-PageDown> gt
nn  <Leader>t :tabnew 

nn  <F7> :cp<CR>
nn  <F8> :cn<CR>

nn  <Space>p "*p
nn  <Space>o "+p
im  <F5>    <C-o><Space>p
im  <S-F5>  <C-o><Space>o

nn  <F9> :make<CR>
nn  <Leader>c :ccl<CR>
nn  <Leader>e :!chmod +x %<CR>:e<CR>

nn  < <<
nn  > >>
vn  > >gv
vn  < <gv

vm  y ygv<Esc>

nn  <F1> :NERDTreeToggle<CR>
nn  <S-F1> :exe 'NERDTree' getcwd()<CR>
nn  <Leader>f :NERDTreeFind<CR>

vm  X <Plug>(Exchange)gv<Esc>
vm  ga <Plug>(EasyAlign)

nn  <silent> <Leader>a :let &mouse= !empty(&mouse) ? '' : 'a'<CR>
nn  Z :exe '!websearch ' . shellescape(expand('<cword>'), 1)<CR><CR>
nn  y :!echo %:p:S \| xclip<CR><CR>

nn  <F10> :make<CR>
" }}}

com! -bar SudoW sil exe "w !sudo tee % >/dev/null" | sil e!

" colorz {{{
se bg=dark
se t_Co=256
if (has("termguicolors"))
	set termguicolors
endif
color peaksea
"colorscheme OceanicNext
hi Normal ctermfg=252 ctermbg=NONE cterm=NONE
hi NonText ctermfg=18 ctermbg=NONE cterm=NONE
hi CursorLine ctermbg=234 cterm=NONE
" }}}

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
