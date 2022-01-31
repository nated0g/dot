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

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


