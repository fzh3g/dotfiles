" =================== General Config =================

set nocompatible                " Be iMproved
set number                      " Line numbers
set rnu                         " Relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set whichwrap+=<,>,h,l          " Automatically wrap left and right
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
set hidden                      " buffers can exist in the background without being in a window.
set ffs=unix,dos,mac            " Use Unix as the standard file type

" leader
let mapleader = ','
let g:mapleader = ','

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" formatoptions
set formatoptions+=m
set formatoptions+=B

" filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.cache/vim')
  silent !mkdir ~/.cache/vim > /dev/null 2>&1
  set undodir=~/.cache/vim
  set undofile
endif

" Indentation
set smarttab
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4
set smartindent
set shiftround

" wrap lines
set wrap
set wm=2
set textwidth=0

" Folds
set foldenable
set foldmethod=indent
set foldlevel=99
" <leader>zz to toggle fold
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
function! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfunction

" Completion
set wildmenu
set wildmode=list:longest
set completeopt=longest,menu

" Search
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic

" Clean search (highlight)
nnoremap <silent> <leader>l :noh<cr>

" Scrolling
" redraw only when we need to
set lazyredraw
set scrolloff=5

" Split
set splitbelow
set splitright

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
set background=dark
set gfn=Monospace\ 11
set t_Co=256

" syntax highlighting
syntax enable

" title
set title
set titlestring=%F

" status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

" font
if has("gui_running")
    set guioptions-=m       " Removes top menubar
    set guioptions-=T       " Removes top toolbar
    set guioptions-=r       " Removes right hand scroll bar
    set go-=L               " Removes left hand scroll bar
    set lines=32 columns=86
    set guitablabel=%M\ %t
    if has("gui_mac") || has("gui_macvim")
        set guifont=Monaco\ for\ Powerline:h12
    elseif has("gui_win32")
        set guifont=Monaco_for_Powerline:h12:cANSI
    elseif has("gui_gtk2")
        set guifont=Monaco\ for\ Powerline\ 10
    endif
endif


" <leader>m to toggle menubar
nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" ================== Plugins =========================

call plug#begin('~/.vim/plugged')

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
  " comment
  Plug 'scrooloose/nerdcommenter'
  " easymotion for fast jump.
  Plug 'easymotion/vim-easymotion'
  " color scheme
  Plug 'w0ng/vim-hybrid'
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
  " a solid language pack
  Plug 'sheerun/vim-polyglot'
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

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 28

" Airline
"let g:airline_theme = 'hybrid'
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gr :Gremove<CR>

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 0
nnoremap <leader>gg :GitGutterToggle<CR>

" CtrlP
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn|DS_Store))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
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

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.o$', '\.so$', '\.pyo$', '^\.git$', '^\.svn$', '^\.hg$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 28
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <F3> :NERDTreeToggle<CR>
map <F3> <plug>NERDTreeTabsToggle<CR>

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
let g:jedi#goto_assignments_command = "<leader>jga"
let g:jedi#goto_definitions_command = "<leader>jgd"
let g:jedi#documentation_command = "<leader>jd"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#show_call_signatures = "0"

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=79
      \ formatoptions+=croq
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" ================= Mapping ==========================

" set working directory
nnoremap <leader>cd :lcd %:p:h<CR>

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" use ; for commands.
nnoremap ; :

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Emacs like keys
map <C-A>		<Home>
map <C-E>		<End>
cnoremap <C-P>  <Up>
cnoremap <C-N>  <Down>
cnoremap <C-K>	<C-U>

" fast saving
nmap <leader>w :w!<CR>

" fast quit
nmap <leader>q :q!<CR>

" Copy/Paste/Cut
set clipboard=unnamed
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
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Buffer nav
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <left> :bprevious<CR>
noremap <right> :bnext<CR>

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Tabs
map <C-t> :tabnew<CR>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tt' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" select all
map <Leader>sa ggVG"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" color scheme
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
