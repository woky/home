setlocal expandtab
setlocal tabstop=4

"compiler python

nnoremap <F10> :w !python3<CR>
nnoremap <Leader>y :!yapf -i %<CR>:!isort %<CR>

packadd jedi-vim
