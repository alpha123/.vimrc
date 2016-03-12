" General
if has('win32') || has('win64')
  set rtp=$VIM/vimfiles,$VIMRUNTIME,~/.vim,~/.vim/after
endif
set nocompatible
set encoding=utf-8
set undolevels=1000

if has('nvim')
  let g:python_host_prog = '/usr/local/bin/python2.7'
endif

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

" Short useful functions

function! <SID>Source(start,end)
  let tmp = @z
  silent exec a:start.",".a:end."yank z"
  let @z = substitute(@z,'\n\s*\\','','g')
  @z
  let @z = tmp
endfunction

command! -nargs=? -bar -range Source | call <SID>Source(<line1>,<line2>)

function! SwitchCSrc()
  if bufname("%") =~ "\.c$"
    if bufexists(expand("%<").".h")
      exec "b ".expand("%<").".h"
    else
      exec "e %<.h"
    endif
  else
    if bufexists(expand("%<").".c")
      exec "b ".expand("%<").".c"
    else
      exec "e %<.c"
    endif
  endif
endfunction

" Keybindings
nnoremap <Space> <Nop>
let mapleader="\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>s :OverCommandLine<CR>
vnoremap <Leader>s :OverCommandLine<CR>

nnoremap : :<C-u>call SkyBison("")<CR>

" Fix j/k and wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" I find these slightly more convenient for
" beginning/end of line/file.
nnoremap gh ^
nnoremap gl $
nnoremap gk gg
nnoremap gj G
vnoremap gh ^
vnoremap gl $
vnoremap gk gg
vnoremap gj G

nnoremap <F9> :make<CR>
inoremap <F9> :make<CR>

nnoremap gs :call SwitchCSrc()<CR>

" UI
set laststatus=2

if has("gui_running")
  set guifont=Anonymice\ Powerline\ 11
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
Plugin 'w0ng/vim-hybrid'
Plugin 'Wutzara/vim-materialtheme'

" Editing
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'paradigm/TextObjectify'
Plugin 'rhysd/clever-f.vim'

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
Plugin 'vasconcelloslf/vim-interestingwords'
let g:interestingWordsGUIColors = ['#906352', '#ea856f', '#eeba6a', '#bb9b71', '#84988d', '#eefeef']
let g:interestingWordsRandomiseColors = 1
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
Plugin 'wellle/targets.vim'
Plugin 'benekastah/neomake'

" Completion
Plugin 'ajh17/VimCompletesMe'

" Git
Plugin 'tpope/vim-fugitive'

" HTML
"Plugin 'jaxbot/browserlink.vim'
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

" Rust
Plugin 'rust-lang/rust.vim'

" Common Lisp
Plugin 'kovisoft/slimv'
let g:slimv_impl = 'clozure'
let g:slimv_preferred = 'clozure'

" C
Plugin 'Rip-Rip/clang_complete'
Plugin 'c.vim'
Plugin 'rhysd/vim-clang-format'
let g:clang_format#command = 'clang-format37'

autocmd FileType c set makeprg='ninja'

" D
Plugin 'idanarye/vim-dutyl'
let g:dutyl_stdImportPaths=['/usr/local/include/d/phobos2']

" Other
" i3 window manager configuration file syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

call vundle#end()
syntax enable
filetype plugin indent on

" Filetypes
autocmd BufNewFile,BufRead *.asd set filetype=lisp " ASDF system definitions
autocmd BufRead *i3/config set filetype=i3 " i3wm config file

" Extra initialization that must be done after vundle#end
call dutyl#register#tool('dcd-client','/usr/home/peter/DCD/bin/dcd-client')
call dutyl#register#tool('dcd-server','/usr/home/peter/DCD/bin/dcd-server')
call dutyl#register#tool('dfmt','/usr/home/peter/dfmt/bin/dfmt')

" Color scheme
"colorscheme solarized
"set background=dark
colorscheme hybrid
