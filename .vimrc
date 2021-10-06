" vim:fdm=marker:
set nocp

if has("win32")
    set rtp+=$HOME/.vim
endif

" OPTIONS {{{

set autoindent
set autoread
set backspace=2
set confirm
set cursorline
set foldlevelstart=99
set formatoptions+=j
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set modeline
set mouse=a
set noequalalways
set nojoinspaces
set nowrap
set number
set relativenumber
set shiftround
set shiftwidth=4
set shortmess=aI
set showcmd
set splitbelow
set splitright
set tabstop=4
set textwidth=80
set whichwrap+=h,l,<,>,[,]
set wildmenu
set wildmode=list:longest,full

" }}}

" KEYS {{{

let mapleader='\'

set <S-F1>=[1;2P
set <S-F2>=[1;2Q
set <S-F3>=[1;2R
set <S-F4>=[1;2S

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-n> :let v:hlsearch=1 \| let @/=expand("<cword>")<CR>

nnoremap <F2> :Buffers<CR>
nnoremap <F3> :noh<CR>
nnoremap <F4> :set rnu!<CR>
nnoremap <F5> :bp!<CR>
nnoremap <F6> :bn!<CR>
nnoremap <F7> :cp<CR>
nnoremap <F8> :cn<CR>
nnoremap <F10> :make<CR>

nnoremap <Leader>a :e %:h/
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>d :lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>e :!chmod +x %<CR>:e<CR>
nnoremap <Leader>m :let &mouse= !empty(&mouse) ? '' : 'a'<CR>:set mouse?<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :set list!<CR>
nnoremap <Leader>t :tabnew 
nnoremap <Leader>w :set wrap!<CR>
nnoremap <Leader>wq :x<CR>
nnoremap <Leader>xs :bd<cr>
nnoremap <Leader>xx :hide<cr>

nnoremap <C-s> :update<CR>
imap <C-s> <C-o><C-s>

nnoremap <Space>o "+p
nnoremap <Space>p "*p
nnoremap \\ :e<CR>

inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

imap <F5> <C-o><Space>p
imap <S-F5> <C-o><Space>o

" keep cursor at the end line
vmap y ygv<Esc>

"nnoremap Z :exe '!websearch ' . shellescape(expand('<cword>'), 1)<CR><CR>
"nnoremap y :!echo %:p:S \| xclip<CR><CR>
"nnoremap c :w !xclip<CR><CR>

nnoremap <F1>       :packadd nerdtree \| :NERDTreeToggle<CR>
nnoremap <Leader>f  :packadd nerdtree \| :NERDTreeFind<CR>

" }}}

" COMMANDS {{{

com! -bar SudoW silent exe "w !sudo tee % >/dev/null"

" }}}

" THEME {{{

set t_Co=256
if has("termguicolors")
    set termguicolors
endif

syntax on

set bg=dark
color peaksea

hi Normal ctermfg=252 ctermbg=NONE cterm=NONE
hi NonText ctermfg=18 ctermbg=NONE cterm=NONE
hi CursorLine ctermbg=234 cterm=NONE

" }}}

" PLUGINS {{{

filetype plugin indent on

let NERDTreeChDirMode=2
let NERDTreeIgnore=['__pycache__']
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=3
let NERDTreeShowLineNumbers=1
let jsonnet_fmt_on_save = 0
let perl_fold=1
let puppet_align_hashes = 0
let terraform_align=1
let terraform_fmt_on_save=0
let vimtex_quickfix_open_on_warning=0
let xml_syntax_folding=1

packadd fzf
packadd fzf.vim
packadd vim-gitgutter
packadd vim-open-github
packadd vim-repeat
packadd vim-searchindex
"packadd vim-startuptime
packadd vim-surround
"packadd vim-unimpaired

" }}}

" PLUGIN : editorconfig-vim {{{

function! FiletypeHook(config)
    if has_key(a:config, 'vim_filetype')
        let &filetype = a:config['vim_filetype']
    endif
    return 0   " Return 0 to show no error happened
endfunction

packadd editorconfig-vim

call editorconfig#AddNewHook(function('FiletypeHook'))

" }}}

" PLUGIN : vim-lsp {{{

if executable('ccls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \   lsp#utils#find_nearest_parent_file_directory(
        \       lsp#utils#get_buffer_path(),
        \       ['.ccls', 'compile_commands.json', '.git/']
        \   )
        \ )},
        \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" }}}

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
