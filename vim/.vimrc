" =================== General Config =================

set nocompatible                " Be iMproved
set t_RV=                       " http://bugs.debian.org/608242
set backspace=indent,eol,start  " Allow backspace in insert mode
set whichwrap+=h,l,<,>,[,]      " Backspace and cursor keys wrap too
set nowrap                      " Do not wrap long lines
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set showmatch                   " Show matching brackets/parenthesis
set matchtime=1                 " 0.1 second to show the matching parenthesis
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set ruler                       " Always show current position
set modeline                    " Enable modeline.
set esckeys                     " Cursor keys in insert mode.
set nojoinspaces                " No two spaces after punctuation on a join (J)
set hidden                      " Buffers can exist in the background
set ffs=unix,dos,mac            " Use Unix as the standard file type
set acd                         " Change the CWD whenever open a file
set confirm                     " Get a dialog when :q, :w, or :wq fails
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set linespace=0                 " No extra spaces between rows
set winminheight=0              " Windows can be 0 line high
set foldenable                  " Auto fold code
set cursorline                  " Highlight current line
set tabpagemax=15               " Only show 15 tabs
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore         " Allow for cursor beyond last character
set noerrorbells                " No beeps.
set novisualbell                " Turn off visual bell
set visualbell t_vb=            " Turn off error beep/flash

syntax on                       " Turn syntax highlighting on
filetype plugin indent on       " Automatically detect file types

" Add a colored column at 80
if exists('+colorcolumn')
    set colorcolumn=80
endif

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" Turn off swap files and backup files
set noswapfile
set nobackup
set nowb

" Leader
let mapleader = ','
let g:mapleader = ','

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
    if !isdirectory(expand('~').'/.vim/undodir')
        silent !mkdir -p ~/.vim/undodir > /dev/null 2>&1
    endif
    set undodir=~/.vim/undodir
    set undofile
endif

" Indentation
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set expandtab                   " Tabs are spaces, not tabs
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set smarttab                    " Wrap line indentation
set shiftround

" Completion
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set completeopt-=longest
set completeopt+=menuone
set completeopt-=menu
set completeopt-=preview

" Search
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms

" Clipboard
if has('clipboard')
    if has('unnamedplus')       " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                        " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Scrolling
set lazyredraw                  " Redraw only when we need to
set scrolloff=3                 " Minimum lines to keep above and below cursor
set scrolljump=5                " Lines to scroll when cursor leaves screen

" Split
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current

" Relative numbering
set number                      " Line numbers
if exists('+relativenumber')    " Relative line numbers
  set rnu
endif

" ================== Plugins =========================
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plugins {
" ctrl-p is a fuzzy file finder.
Plug 'ctrlpvim/ctrlp.vim'
" airline is a better status line and a tab-bar for vim.
Plug 'vim-airline/vim-airline'
" nerdtree
Plug 'scrooloose/nerdtree'
" comment
Plug 'scrooloose/nerdcommenter'
" easymotion for fast jump.
Plug 'easymotion/vim-easymotion'
" color scheme
Plug 'morhetz/gruvbox'
" quoting and parenthesizing
Plug 'tpope/vim-surround'
" tagbar
Plug 'majutsushi/tagbar'
" ale
Plug 'w0rp/ale'
" trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" python
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
" auto complete
Plug 'maralla/completor.vim'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Indent line
Plug 'Yggdroot/indentLine'
" fugitive, a git wrapper
Plug 'tpope/vim-fugitive'
" gitgutter
Plug 'airblade/vim-gitgutter'
" }

call plug#end()

" ============== Plugin Settings =====================

" CtrlP
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn|DS_Store))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
noremap <leader>bl :CtrlPBuffer<CR>
noremap <leader>f :CtrlPMRU<CR>
noremap <leader>l :CtrlPLine<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_max = 500
let g:ctrlp_max_hight = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 10

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>. <Plug>(easymotion-repeat)
let g:Easymotion_smartcase = 1

" trailingwhitespace
map <leader><space> :FixWhitespace<CR>
set list
set listchars=tab:▸\ ,trail:•,extends:#,nbsp:. " Highlight whitespace

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 28

" Airline
" let g:airline_theme = 'jellybeans'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1

" ale
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
nmap <leader>sk <Plug>(ale_previous_wrap)
nmap <leader>sj <Plug>(ale_next_wrap)
nmap <leader>st :ALEToggle<CR>
nmap <Leader>sd :ALEDetail<CR>

" pythonsyntax
let python_highlight_all = 1

" fugitive
if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif
noremap <leader>gs :Gstatus<CR>
noremap <leader>gd :Gvdiff<CR>

" gitgutter
let g:gitgutter_enabled =0
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 0
nnoremap <leader>gg :GitGutterToggle<CR>

" NERDTree
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.o$', '\.so$', '\.pyo$', '^\.git$', '^\.svn$', '^\.hg$', '__pycache__']
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 1
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeWinSize = 28
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.sqlite
map <F3> :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:ulti_expand_or_jump_res = 0

" Completor
let g:completor_set_options = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
                \ formatoptions+=croq
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" ================= Mapping ==========================

" use ; for commands.
nnoremap ; :

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" fast saving
nmap <leader>w :w!<CR>

" fast quit
nmap <leader>q :q!<CR>

" Buffer nav
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>

" Close the current buffer
map <leader>bd :bd<CR>

" Close all the buffers
map <leader>ba :bufdo bd<CR>

" select all
map <leader>sa ggVG"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Source vim config file
nnoremap <silent><leader>r :so $MYVIMRC<CR>

" GUI
if has("gui_running")
    set guioptions-=m       " Removes top menubar
    set guioptions-=T       " Removes top toolbar
    set guioptions-=r       " Removes right hand scroll bar
    set go-=L               " Removes left hand scroll bar
    set lines=30 columns=120
    if has("macunix")
        set guifont=Fantasque\ Sans\ Mono:h13
    elseif has("win32") || has("win64")
        set guifont=Fantasque_Sans_Mono:h13:cANSI
    elseif has("unix") && !has("macunix") && !has("win32unix")
        set guifont=Fantasque\ Sans\ Mono\ 11
    endif
else
    set t_Co=256
    if has('termguicolors')
        set termguicolors       " True color
    endif
endif

" Color scheme
set background=dark
try
    let g:gruvbox_italic=1
    colorscheme gruvbox
    " colorscheme pablo
catch
endtry
