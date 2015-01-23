" General
set nocompatible
set encoding=utf-8
set undolevels=1000

" Editing
set backspace=indent,eol,start

" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch

" Indentation
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" Built-in plugins
runtime macros/matchit.vim

" Swap files
set dir=~/.vim/swap

" Keybindings
nnoremap <Space> <Nop>
let mapleader="\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>s :OverCommandLine<CR>

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

" Completion
set omnifunc=syntaxcomplete#Complete
set wildmode=longest,list,full
set wildmenu

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle.
" Required!
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/webapi-vim'

" UI
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts=1
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

" Editing
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'paradigm/TextObjectify'

" Files and directories
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-rooter'

" Ex command line
Plugin 'paradigm/SkyBison'
let g:skybison_fuzz=1

" All languages
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
Plugin 'wellle/targets.vim'

" Completion
Plugin 'ajh17/VimCompletesMe'

" Git
Plugin 'tpope/vim-fugitive'

" HTML
Plugin 'jaxbot/browserlink.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mohitleo9/vim-fidget'

" Slim
Plugin 'slim-template/vim-slim'

" CSS
Plugin 'Rykka/colorv.vim'
Plugin 'ap/vim-css-color'
Plugin 'mattn/livestyle-vim'

" Stylus
Plugin 'wavded/vim-stylus'

" JavaScript
Plugin 'marijnh/tern_for_vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails=1
Plugin 'nelstrom/vim-textobj-rubyblock'

call vundle#end()
syntax enable
filetype plugin indent on

" Color scheme
colorscheme solarized
set background=dark
