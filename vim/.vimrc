" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight current line
set ruler                       "Always show current position

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" enable syntax processing
syntax enable

" leader is comma
let mapleader=","
let g:mapleader = ","

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set smarttab
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4
set smartindent

" load filetype-specific indent files
filetype indent on
filetype plugin on

" wrap lines
set wrap

" ================ Folds ============================

set foldenable
set foldlevelstart=10
set foldnestmax=3
set foldmethod=indent

" ================ Completion =======================

set wildmenu
set wildmode=list:longest

" ================ Search ===========================

set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

" ================ Scrolling ========================

" redraw only when we need to
set lazyredraw
set scrolloff=8

" For regular expressions turn magic on
set magic

" ================= Movements =======================

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" fast saving
nmap <leader>w :w!<cr>

" jk is escape
inoremap jk <esc>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
