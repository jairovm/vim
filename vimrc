execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

set termguicolors

colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark = 'hard'

" Custom config
syntax on

" Settings
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing

set noswapfile                  " Don't use swapfile
set nobackup    	   	          " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" Make Vim to handle long lines nicely.
set nowrap
set textwidth=80
set formatoptions=qrn1

" Do not use relative numbers to where the cursor is.
set norelativenumber

set ts=2                                              " Tabs are 2 spaces
set bs=2                                              " Backspace over everything in insert mode
set softtabstop=2
set shiftwidth=2                                      " Tabs under smart indent
set autoindent
set smarttab
set expandtab
set smartindent
set virtualedit=all
set showmatch                                          " Show matching brackets.

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set softtabstop=2
au BufRead,BufNewFile *.haml setf haml
au BufRead,BufNewFile *.scss setf sass
