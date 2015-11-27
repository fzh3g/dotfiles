" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      " Line numbers
set rnu                         " Relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set cursorline                  " highlight current line
set ruler                       " Always show current position
set noerrorbells                " No beeps.
set modeline                    " Enable modeline.
set esckeys                     " Cursor keys in insert mode.
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" leader
let g:mapleader = ','

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
if has('persistent_undo') && !isdirectory(expand('~').'/.cache/vim')
  silent !mkdir ~/.cache/vim > /dev/null 2>&1
  set undodir=~/.cache/vim
  set undofile
endif

" ================ Indentation ======================

set smarttab
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
set smartindent

" load filetype-specific indent files
filetype plugin indent on

" wrap lines
set wrap
set textwidth=0

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

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
set magic

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" ================ Scrolling ========================

" redraw only when we need to
set lazyredraw
set scrolloff=5

" ================ Split ============================

set splitbelow
set splitright

" For regular expressions turn magic on
set magic

" ============== Relative numbering =================

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

nnoremap <leader>rn :call NumberToggle()<cr>

" ================= Visual ===========================

set background=dark
set guioptions-=m       " Removes top menubar
set guioptions-=T       " Removes top toolbar
set guioptions-=r       " Removes right hand scroll bar
set go-=L               " Removes left hand scroll bar

" syntax highlighting
syntax enable

"Toggle menubar
nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" ================= Mapping ==========================

" use ; for commands.
nnoremap ; :

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
