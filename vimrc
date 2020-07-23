execute pathogen#infect()
call pathogen#helptags()

set nocompatible              " be iMproved, required
filetype off                  " required

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

if has("termguicolors")
  set termguicolors
endif

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
set lazyredraw                  " Wait to redraw "

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

" Folding
set foldmethod=indent
set foldlevel=100

" Make the current window big, but leave others context
" We have to have a winheight bigger than we want to set winminheight.
" But if we set winheight to be huge before winminheight, the winminheight set
" will fail.
set winheight=10
set winminheight=10
set winheight=999

au FocusLost * silent! wa       " Set vim to save the file on focus out.

" 80 character limit
if exists('+colorcolumn')
  hi ColorColumn guibg=#2d2d2d ctermbg=246
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Disables number lines on terminal buffers
if has('nvim')
  autocmd TermOpen * :setlocal nonumber norelativenumber signcolumn=no
endif

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Mappings
" -----------------------------------------

" Maps space to default leader
xmap <space> \
nmap <space> \

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-z> :bprev<CR>
nnoremap <C-x> :bnext<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast closing
nnoremap <silent> <leader>q :Sayonara<CR>

" Copy & Paste
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Do not show stupid q: window
map q: :q

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Terminal
if has('nvim')
  nnoremap <silent> <leader>t :wa<CR>:Term<CR>
  tnoremap <silent> <leader><Esc> <C-\><C-n>:Sayonara<CR>
endif

if !has('nvim')
  " Allow hitting <Esc> to switch to normal mode
  tnoremap <Esc> <C-\><C-n>
  nnoremap <silent> <leader>t :wa<CR>:terminal<CR>
  tnoremap <silent> <leader><Esc> <C-\><C-n>:bdelete!<CR>
endif

" File Type settings
" -----------------------------------------
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml,*.erb,*.haml,*.js set softtabstop=2
au BufRead,BufNewFile *.haml setf haml
au BufRead,BufNewFile *.scss setf sass
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

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

" ========= vim-better-whitespace ==================

" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

 " =================== coc.nvim ========================

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" CocSearch
" nnoremap <leader>cs<Space> :CocSearch -s -H --column --context 0 ''<Left>
" nnoremap <leader>csw :CocSearch -s -H --column --context 0 ''<Left><C-R>=expand("<cword>")<CR><CR>
" nnoremap <leader>csw :CocSearch -s -H --column --context 0 <C-R>=expand("<cword>")<CR><CR>

let g:coc_global_extensions = ['coc-solargraph']

" =================== tmuxline.nvim ========================
" git clone https://github.com/edkolev/tmuxline.vim.git bundle/tmuxline.vim

" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W'],
"       \'y'    : ['%Y-%m-%d', '%H:%M'],
"       \'z'    : '#(pmset -g batt | tail -n1 | cut -f2 | cut -d";" -f1)'}

"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType nerdtree set signcolumn=no

" =================== vim-tmux-navigator ========================
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" =================== fzf ========================
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <C-p> :Files<CR>
inoremap <silent> <C-p> <Esc>:Files<CR>
