" General
set nocompatible
filetype on
filetype off
syntax on
set encoding=utf-8
set undolevels=1000

" Editing
set backspace=indent,eol,start

" Searching
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

" Indentation
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" Files and directories
set autochdir

" Keybindings
:let mapleader = ","

" UI
set laststatus=2

if has("gui_running")
	set guifont=Anonymice\ Powerline:h11
	set guioptions-=m
	set guioptions-=T
endif

" Line numbers
set number
set relativenumber

" Vundle
set rtp+=~\.vim\bundle\vundle
call vundle#rc()

" Let Vundle manage Vundle.
" Required! 
Bundle 'gmarik/vundle'

" General
Bundle 'tpope/vim-repeat'

" UI
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1
Bundle 'majutsushi/tagbar'

" Editing
Bundle 'Lokaltog/vim-easymotion'

" Files and directories
Bundle 'kien/ctrlp.vim'

" Color schemes
Bundle 'altercation/vim-colors-solarized'

" All languages
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'taglist.vim'

" Git
Bundle 'tpope/vim-fugitive'

" HTML
Bundle 'mattn/emmet-vim'

" CSS
" Stylus
Bundle 'wavded/vim-stylus'

" JavaScript
Bundle 'marijnh/tern_for_vim'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" This might have to come after Vundle is initialized.
filetype plugin indent on

" Completion
set omnifunc=syntaxcomplete#Complete

" Color scheme
colorscheme solarized
set background=dark
