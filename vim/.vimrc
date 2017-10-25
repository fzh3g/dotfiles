" =================== General Config =================

set nocompatible                " Be iMproved
set number                      " Line numbers
set rnu                         " Relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
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
set hidden                      " Buffers can exist in the background without being in a window.
set ffs=unix,dos,mac            " Use Unix as the standard file type
set acd                         " Change the current working directory whenever you open a file
set confirm                     " Get a dialog when :q, :w, or :wq fails
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set linespace=0                 " No extra spaces between rows
set winminheight=0              " Windows can be 0 line high
set foldenable                  " Auto fold code
set colorcolumn=80              " Add a colored column at 80

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Leader
let mapleader = ','
let g:mapleader = ','

" Syntax highlighting
syntax on

" Automatically detect file types
filetype plugin indent on

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.cache/vim')
    silent !mkdir ~/.cache/vim > /dev/null 2>&1
    set undodir=~/.cache/vim
    set undofile
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Indentation
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set expandtab                   " Tabs are spaces, not tabs
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces

set nowrap                      " Do not wrap long lines

" Completion
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set completeopt=longest,menu

" Search
set showmatch                   " Show matching brackets/parenthesis
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms

" Clipboard
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Clean search (highlight)
nnoremap <silent> <leader>/ :noh<cr>

" Scrolling
" redraw only when we need to
set lazyredraw
set scrolloff=3                 " Minimum lines to keep above and below cursor
set scrolljump=5                " Lines to scroll when cursor leaves screen

" Split
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current

" Relative numbering
nnoremap <leader>rn :call NumberToggle()<cr>
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfunction

" Visual
set background=light
if &term == 'xterm' || &term == 'screen'
    set t_Co=256                    " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

set tabpagemax=15               " Only show 15 tabs
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

" status bar
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %P    " Right aligned file nav info

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" Use modeline overrides
set modeline
set modelines=10

" gui
if has("gui_running")
    set guioptions-=m       " Removes top menubar
    set guioptions-=T       " Removes top toolbar
    set guioptions-=r       " Removes right hand scroll bar
    set go-=L               " Removes left hand scroll bar
    set lines=30 columns=120
    if has("macunix")
        set guifont=Monaco\ for\ Powerline:h12
    elseif has("win32") || has("win64")
        set guifont=Monaco_for_Powerline:h12:cANSI
    elseif has("unix") && !has("macunix") && !has("win32unix")
        set guifont=Monaco\ for\ Powerline\ 10
    endif
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
Plug 'FelikZ/ctrlp-py-matcher'
" airline is a better status line and a tab-bar for vim.
Plug 'vim-airline/vim-airline'
" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" comment
Plug 'scrooloose/nerdcommenter'
" easymotion for fast jump.
Plug 'easymotion/vim-easymotion'
" color scheme
Plug 'morhetz/gruvbox'
" surround
Plug 'tpope/vim-surround'
" auto close pairs
Plug 'Raimondi/delimitMate'
" tagbar
Plug 'majutsushi/tagbar'
" syntastic
Plug 'scrooloose/syntastic'
" trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" python
Plug 'davidhalter/jedi-vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
" auto complete
Plug 'Shougo/neocomplete.vim'
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
if executable('ag')
    let s:ctrlp_user_command = 'ag %s --nocolor -l --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_max = 500
let g:ctrlp_max_hight = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 10


" nerdcommenter
let g:NERDSpaceDelims=1

" delimitMate
au FileType python let b:delimitMate_nesting_quotes = ['"']

" Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <leader><Leader>j <Plug>(easymotion-j)
map <leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>. <Plug>(easymotion-repeat)
let g:Easymotion_smartcase = 1

" trailingwhitespace
map <leader><space> :FixWhitespace<cr>
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 28

" Airline
" let g:airline_theme = 'jellybeans'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['pyflakes', 'pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'

" pythonsyntax
let python_highlight_all = 1

" fugitive
if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gd :Gvdiff<CR>

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 0
nnoremap <leader>gg :GitGutterToggle<CR>

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.o$', '\.so$', '\.pyo$', '^\.git$', '^\.svn$', '^\.hg$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 28
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <F3> :NERDTreeToggle<CR>
map <F3> <plug>NERDTreeTabsToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>

" snippets
let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:ulti_expand_or_jump_res = 0

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#max_list = 15
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" <CR>: choose current item
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
" <s-CR>: close popup and save indent.
inoremap <silent> <s-CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"

" vim-python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
                \ formatoptions+=croq
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" ================= Mapping ==========================

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

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
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>
noremap <left> :bprevious<CR>
noremap <right> :bnext<CR>

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" select all
map <Leader>sa ggVG"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" color scheme
try
    let g:gruvbox_italic=1
    colorscheme gruvbox
catch
endtry
