setlocal expandtab
setlocal tabstop=4

"compiler python

nnoremap <F10> :echo system('python3', bufnr('%'))<CR>
nnoremap <Leader>y :!yapf -i %<CR>:!isort %<CR>

packadd jedi-vim
