call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'ayu-theme/ayu-vim' " or other package manager
call plug#end()

" Theming

set termguicolors     " enable true colors support
"let ayucolor="light" " for mirage version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark" " for mirage version of theme
colorscheme ayu

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

nnoremap <SPACE> <Nop>
let mapleader=" "


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>nb :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

set number relativenumber
set mouse=a

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>oib :silent !explorer.exe %<CR> "Open In Browser

" Not really the correct way to use tabs, change to using buffers instead
"nnoremap <leader>h :tabp<CR> " previous tab
"nnoremap <leader>l :tabn<CR> " next tab
"nnoremap <leader>nt :tabnew<CR> " new tab

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

