syntax on
colorscheme wellsokai
set nocompatible              " be iMproved, required
set ttyfast
set mouse=a
set ttymouse=xterm2
filetype off                  " required
:set tabstop=2 shiftwidth=2 expandtab
:set incsearch
:set hlsearch
:set ruler
:set nu
:imap jj <Esc>
:set clipboard=unnamed
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gdiff<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
nmap <C-w>gf :tabe **/<cfile><cr>
map <C-w>o <C-w><bar><CR><C-w>_<CR>
let mapleader = "\<Space>"
set laststatus=2

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

let g:CommandTMaxFiles=20000
let g:CommandTFileScanner="git"

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
nmap <Leader>j :%!python -m json.tool<CR>

if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gaogao1030/vim-skim'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on
