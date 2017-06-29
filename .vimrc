syntax on
colorscheme quantum
set nocompatible
set ttyfast
set mouse=a
set ttymouse=xterm2
set rnu
filetype off
":set colorcolumn=120
:set directory=~/.vim/swapfiles//
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
map <C-w>f <C-w><bar><C-w>_
let mapleader = "\<Space>"
set laststatus=2
autocmd FileType swift setlocal shiftwidth=4 tabstop=4

" Ignore swap file warning message
set shortmess+=A

" Toggle between tabs
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

" Goyo
noremap <Leader>gy :Goyo<CR>
noremap <Leader>gg :Goyo!<CR>
let g:goyo_width = 130
let g:goyo_height = '95%'


" FZF
set rtp+=/usr/local/opt/fzf
noremap <Leader>t :FZF<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>a :Ag<Space>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(<q-args>,
\                     fzf#vim#with_preview('right:50%:hidden', '?'),
\                     <bang>0)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~10%' }

" Command T
"let g:CommandTMaxFiles=20000
"let g:CommandTFileScanner="git"

" Rubocop
let g:vimrubocop_config = '~/workspace/viewthespace/.rubocop.yml'

" JSONify text on window
"nmap <Leader>j :%!python -m json.tool<CR>

"if &term =~ "xterm" || &term =~ "screen"
	"let g:CommandTCancelMap = ['<ESC>', '<C-c>']
"endif

" Delete whitespace when saving a file
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

map <Leader>n :NERDTreeToggle<CR>

" Copy full path to clipboard
nmap cq :let @*=expand("%:p")<CR>
" Copy relative path to clipboard
nmap cw :let @*=expand("%")<CR>

" Windowswap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <Leader>qq :call WindowSwap#EasyWindowSwap()<CR>

" Buffer stuff
set hidden
nnoremap <C-M> :bnext<CR>
nnoremap <C-N> :bprev<CR>
nmap <Leader>dd :bd<CR><ESC>
nmap <Leader>da :%bd<CR><ESC>
let g:buftabline_separators=1

" Move to mark
nnoremap mm `

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Ack + Silver searcher
"if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
"endif
"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>

let g:javascript_plugin_jsdoc = 1

" Add jsx syntax highlighting for .js files
let g:jsx_ext_required = 0

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

" Run current test
map <Leader>r :w\|:!rspec %<CR>

" Navigate autocomplete window
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

noremap <Leader>ct :!ripper-tags -R .<cr>
set tags=./tags,tags;

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gaogao1030/vim-skim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'toyamarinyon/vim-swift'
Plugin 'mitsuse/autocomplete-swift'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-buftabline'
Plugin 'pangloss/vim-javascript'
Plugin 'cohama/lexima.vim'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'leafgarland/typescript-vim'
Plugin 'gregsexton/matchtag'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'wesQ3/vim-windowswap'
call vundle#end()

filetype plugin indent on
filetype plugin on
