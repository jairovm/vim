execute pathogen#infect()
call pathogen#helptags()

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

set ts=2                        " Tabs are 2 spaces
set bs=2                        " Backspace over everything in insert mode
set softtabstop=2
set shiftwidth=2                " Tabs under smart indent
set autoindent
set smarttab
set expandtab
set smartindent
set virtualedit=all
set showmatch                   " Show matching brackets.

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

au FocusLost * silent! wa       " Set vim to save the file on focus out.

" 80 character limit
if exists('+colorcolumn')
  hi ColorColumn guibg=#2d2d2d ctermbg=246
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" File Type settings
" -----------------------------------------
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set softtabstop=2
au BufRead,BufNewFile *.haml setf haml
au BufRead,BufNewFile *.scss setf sass
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

" Plugin configs
" -----------------------------------------

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>
