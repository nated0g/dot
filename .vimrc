"*********************************
" Vim-Plug 
" *********************************

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
"Plug 'roman/golden-ratio'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dpelle/vim-LanguageTool'
Plug 'dense-analysis/ale'
Plug 'pprovost/vim-ps1'

call plug#end()

let g:netrw_altv=1

let g:ale_fixers = {'css': ['prettier']}

let g:languagetool_jar="/usr/local/LanguageTool-5.6-stable/languagetool-commandline.jar"

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
nnoremap <leader>sv :source ~/.vimrc<CR>

" Open In Browser
" nnoremap <leader>oib :!wslview %<CR> | :redraw!

" Open In Browser, better version that starts a live-server in the current
" directory, outputting server log to tmux split
" sudo npm install -g live-server 
nnoremap <leader>oib :silent !tmux split-window -l 4 "live-server --browser=wslview"<CR> | :redraw!

" Markdown Preview
nmap <leader>mp :MarkdownPreview<CR>

" Easier navigation of splits

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"
" Wrap visual selection in an HTML tag.
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
	let tag = input("Tag to wrap block: ")
	if len(tag) > 0
		normal `>
		if &selection == 'exclusive'
			exe "normal i</".tag.">"
		else
			exe "normal a</".tag.">"
		endif
		normal `<
		exe "normal i<".tag.">"
		normal `<
	endif
endfunction

" fix indentation 
nnoremap <leader>fi gg=G<CR> 

" run "go test"
nnoremap <leader>gt :!go test<CR>

" redraw 
nnoremap <leader>rd :redraw!<CR>

" splits

nnoremap <leader>vs :vsp<CR>
nnoremap <leader>hs :sp<CR>

" *********************************
" Misc. 
" *********************************


" clear after exit
au VimLeave * :!clear

" use ripgrep for grep
" from https://phelipetls.github.io/posts/extending-vim-with-ripgrep/
if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
	set grepformat=%f:%l:%c:%m
endif

set ttymouse=xterm2
set mouse=a

set tabstop=2
set shiftwidth=2
set expandtab

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

