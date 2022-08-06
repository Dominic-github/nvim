let mapleader = ","

filetype plugin on
filetype plugin indent on

autocmd BufEnter * :set scroll=10
syntax on
set encoding=UTF-8
set mouse=a


 " Always show tabs
 set showtabline=2

 " We don't need to see things like -- INSERT -- anymore
set noshowmode

"Set font and font size // need Fira Code
set guifont=Fira\ Code:h10

set incsearch
set hlsearch

set signcolumn=yes
set cursorline

set number
set relativenumber
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set nobackup                      " This is recommended by coc
set nowritebackup                 " This is recommended by coc
set updatetime=100
set wildignore+=*/node_modules/*  "ignore node_modules folder in fuzzy finder
	
set termguicolors               "show color


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




