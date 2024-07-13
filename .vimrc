"" Vim plugins.
call plug#begin()


"" Stuff for making vim more appealing.
Plug 'sangdol/mintabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'rakr/vim-one'
Plug 'fabrizio-ottati/vim-colors-github'

"" Stuff for code formatting.
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

set backspace=indent,eol,start
set termguicolors

"" Color scheme.
" colorscheme one
" set background=light
" let g:airline_theme='one'
" let g:one_allow_italics = 1

" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 0
" use the dark theme
set background=light
" more blocky diff markers in signcolumn (e.g. GitGutter)
let g:github_colors_block_diffmark = 0
colorscheme github
" if you use airline / lightline
let g:airline_theme = "github"

"" Disable compatibility with vi
set nocompatible 

"" Relative number (easier to rank)
set number relativenumber

"" Color column to stay under 80 chars.
set colorcolumn=80
set textwidth=1000
set cursorline

"" Spaces instead of tabs.
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

"" Indentation.
set ai "" Autoindent.
set si "" Smart indent.
set wrap "" Wrapping lines.

"" Enabling filetype plugins.
filetype plugin on
filetype indent on

"" Always show current position.
set ruler

"" Show matching brackets.
set showmatch

"" Syntax highlighting
syntax enable

"" Using UTF8 encoding
set encoding=utf8

"" Turn backup off.
set nobackup
set nowb 
set noswapfile

"" Removing tab expansion for Makefile.
autocmd FileType make setlocal noexpandtab

" "" Removing colorcolumn for Markdown files.
" autocmd FileType markdown setlocal colorcolumn=
" autocmd FileType markdown setlocal nolbr
" autocmd FileType markdown setlocal tw=1000
" 
" "" Turning on spell check for Markdown.
" autocmd FileType markdown setlocal spell spelllang=en
" 
" "" Removing colorcolumn for plain text files.
" autocmd FileType text setlocal colorcolumn=
" autocmd FileType text setlocal nolbr
" autocmd FileType text setlocal tw=1000
" 
" "" Turning on spell check for plain text files.
" autocmd FileType text setlocal spell spelllang=en

"" Setting indentation to four spaces for Python and Rust files.
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal shiftwidth=4
autocmd Filetype rust setlocal tabstop=4
autocmd Filetype rust setlocal shiftwidth=4

"" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

"" Enabling mouse support
set mouse=a

"" Indentation guide.
let g:indent_guides_guide_size = 1

