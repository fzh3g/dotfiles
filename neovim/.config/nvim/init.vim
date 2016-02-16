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
let mapleader = ','

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set bomb
set binary

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
set tabstop=4
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=4
set smartindent

" load filetype-specific indent files
filetype plugin indent on

" wrap lines
set wrap
set wm=2
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

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

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
" set guioptions-=m       " Removes top menubar
" set guioptions-=T       " Removes top toolbar
" set guioptions-=r       " Removes right hand scroll bar
" set go-=L               " Removes left hand scroll bar

set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" status bar
set laststatus=2

" title
set title
set titleold="Terminal"
set titlestring=%F

" status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" terminal
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Monaco:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1
endif

if &term =~ '256color'
  set t_ut=
endif

" syntax highlighting
syntax enable

"Toggle menubar
nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" ================== Plugins =========================

call plug#begin('~/.config/nvim/plugged')

" Plugins {
  " ctrl-p is a fuzzy file finder.
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  " airline is a better status line and a tab-bar for nvim.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  " easymotion for fast jump.
  Plug 'easymotion/vim-easymotion'
  " color scheme
  Plug 'morhetz/gruvbox'
  " auto-pairs
  Plug 'jiangmiao/auto-pairs'
  " tagbar
  Plug 'majutsushi/tagbar'
  " syntastic
  Plug 'scrooloose/syntastic'
  " Python
  Plug 'davidhalter/jedi-vim'
  " Indent line
  Plug 'Yggdroot/indentLine'
" }

call plug#end()

" ============== Plugin Settings =====================

" CtrlP
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn|DS_Store))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>f :CtrlPMRU<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_max = 500
let g:ctrlp_max_hight = 15
let g:ctrlp_match_window_reversed = 0

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1

" Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <leader><Leader>j <Plug>(easymotion-j)
map <leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>. <Plug>(easymotion-repeat)
let g:Easymotion_smartcase = 1

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=W391'

" ================= Mapping ==========================

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

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

" ================= Mapping ==========================

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

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
nmap <leader>w :w!<CR>

" fast quit
nmap <leader>q :q!<CR>


" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Buffer nav
noremap <leader>] :bn<CR>
noremap <leader>[ :bp<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Tabs
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" color scheme
let g:gruvbox_italic = 1
colorscheme gruvbox
