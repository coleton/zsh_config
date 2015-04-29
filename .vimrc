" Make Vim more useful
set nocompatible
" Required
filetype off
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Line Numbers
" set relativenumber
" Enable syntax highlighting
syntax on
" Enable dark background
set background=dark
" Highlight current line
set cursorline

" Comment Paste Fix
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
set nosi noai

set formatoptions-=r
set formatoptions-=o

" tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set text width to 80 characters
set textwidth=80

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
" set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Lower timeout on commands
set timeoutlen=20
set ttimeoutlen=-1


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required

colorscheme solarized
let g:solarized_termcolors=256
