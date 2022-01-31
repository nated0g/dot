call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'

call plug#end()

set number relativenumber
set mouse=a

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>oib :silent !explorer.exe %<CR> "Open In Browser

nnoremap <leader>h :tabp<CR> " previous tab
nnoremap <leader>l :tabn<CR> " next tab

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

