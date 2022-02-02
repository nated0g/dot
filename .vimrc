"*********************************
" Vim-Plug 
" *********************************

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
"Plug 'ayu-theme/ayu-vim' 
Plug 'arcticicestudio/nord-vim'
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}

call plug#end()


" *********************************
" Theming 
" *********************************

"set termguicolors     " enable true colors support
"let ayucolor="light" 
"let ayucolor="mirage"
"let ayucolor="dark" 
"colorscheme ayu
colorscheme nord

set number relativenumber
set cursorline

" *********************************
" Buffers/Tabs 
" *********************************

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" *********************************
" Keymapping 
" *********************************

nnoremap <SPACE> <Nop>
let mapleader=" "
"let g:user_emmet_leader_key=" "

" New buffer
nmap <leader>nb :enew<cr> 

" Next buffer
nmap <leader>l :bnext<CR>

" Previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Source vim config
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Open In Browser
nnoremap <silent> <leader>oib :!wslview %<CR> | :redraw!


" *********************************
" Misc. 
" *********************************

set mouse=a

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

