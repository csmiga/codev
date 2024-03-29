" Modeline and Notes
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)
"
"   Source:
"   http://vi-improved.org/vimrc.html

" Startup
    let s:running_windows = has("win16") || has("win32") || has("win64")
    let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
    "let g:erlangHighlightBif = 1
    "let g:erlangHighLightOperators = 1

" Basics
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set fenc=utf-8 " UTF-8
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    "let g:skip_loading_mswin=1 " Just in case :)

" Newish
    set history=9999 " big old history
    set timeoutlen=300 " super low delay (works for me)
    set formatoptions+=n " Recognize numbered lists
    set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
    set viminfo+=! " Store upper-case registers in viminfo
    set nomore " Short nomore

" General
    "filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    "set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set clipboard+=unnamed " share windows clipboard
    if s:running_windows
        set backupdir=~/vimfiles/backup " where to put backup files
        set directory=~/vimfiles/temp " directory to place swap files in
    else
        set backupdir=~/.vim/backup " where to put backup files
        set directory=~/.vim/temp " directory to place swap files in
    endif
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set nomodeline
    "set modelines=5
    "set mouse=a " use mouse everywhere
    "set mouse=r " 
    "set mouse=v "
    set noerrorbells " don't make noise
    set paste " disables word wrapping and auto-indent and all similar things
    "           that modify typed text.
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    set wildmode=list:longest " turn on wild mode huge list
    "let html_number_lines = 0
    "let html_use_css = 0
    "let use_xhtml = 0
    "let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}

" Vim UI
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    "set list " we do what to show tabs, to ensure we get them out of my files
    "set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    "set nohlsearch " do not highlight searched for phrases
    set hlsearch " highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer

" Text Formatting/Layout
    set completeopt=menuone " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 4, and they will show with set list on

" Folding
    " za : Toggle code folding at the current line. The block that the current
    "      line belongs to is folded (closed) or unfolded (opened).
    " zo : Open fold.
    " zc : Close fold.
    " zR : Open all folds.
    " zM : Close all folds.
    "set foldenable " Turn on folding
    "set foldmethod=indent " Fold on the indent (damn you python)
    "set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    "set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    "function SimpleFoldText() " {
    "    return getline(v:foldstart).' '
    "endfunction " }
    "set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)

" Plugin Settings
    "let b:match_ignorecase = 1 " case is stupid
    "let perl_extended_vars=1 " highlight advanced perl vars inside strings
    "let tlist_aspjscript_settings = 'asp;f:function;c:class'
    "let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    "let tlist_php_settings = 'php;c:class;d:constant;f:function'
    "let tlist_vb_settings = 'asp;f:function;c:class'
    "let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
    "let NERDChristmasTree = 1
    "let NERDTreeMinimalUI = 1
    "let NERDTreeDirArrows = 0

" Mappings
    " hit f11 to paste
    set pastetoggle=<f11>
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    " fuzzymaps
    nmap <leader>f :FufFileWithCurrentBufferDir<CR>
    nmap <leader>ff :FufFile<CR>
    nmap <leader>b :FufBuffer<CR>
    nmap <leader>t :FufBufferTag<CR>
    nmap <leader>tt :FufBufferTagAll<CR>
    nmap <tab> :FufBufferTag<CR>
    " make arrow keys useful
    map <left> <ESC>:NERDTree<RETURN>
    map <right> <ESC>:TagbarToggle<RETURN>
    map <up> <ESC>:bp<RETURN>
    map <down> <ESC>:bn<RETURN>

" Autocommands
    " Override types
    "au BufNewFile,BufRead *.ahk set filetype=ahk
    "au BufNewFile,BufRead *.ps1 set filetype=ps1
    "au BufNewFile,BufRead *.md set filetype=markdown
    "au BufNewFile,BufRead *.dtl set filetype=htmldjango
    "au BufNewFile,BufRead *.rs so ~/.vim/syntax/rust.vim
    "au BufNewFile,BufRead *.yaml so ~/.vim/syntax/yaml.vim
    " Rainbow Parens
    "au VimEnter * RainbowParenthesesToggle
    "au Syntax * RainbowParenthesesLoadRound
    "au Syntax * RainbowParenthesesLoadSquare
    "au Syntax * RainbowParenthesesLoadBraces
    " Remember everything (position, folds, etc)
    "au BufWinLeave * mkview
    "au BufWinEnter * silent loadview

" JSON
    au! BufRead,BufNewFile *.json set filetype=json
    "augroup json_autocmd 
      "autocmd! 
      "autocmd FileType json set autoindent 
      "autocmd FileType json set formatoptions=tcq2l 
      "autocmd FileType json set textwidth=78 shiftwidth=2 
      "autocmd FileType json set softtabstop=2 tabstop=8 
      "autocmd FileType json set expandtab 
      "autocmd FileType json set foldmethod=syntax 
    "augroup END

" Python
    "au BufRead *.py compiler nose
    au! BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    au FileType python set foldmethod=syntax foldlevel=99

" Python - Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" GUI Settings
if has("gui_running")
    " Basics
    " Color options: /usr/share/vim/vim73/colors/
    colorscheme pablo
    set guifont=Consolas:h10 " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    map <F8> <ESC>:set guifont=Consolas:h8<CR>
    map <F9> <ESC>:set guifont=Consolas:h10<CR>
    map <F10> <ESC>:set guifont=Consolas:h12<CR>
    map <F11> <ESC>:set guifont=Consolas:h16<CR>
    map <F12> <ESC>:set guifont=Consolas:h20<CR>
endif

" Term Settings
if s:colorful_term
    "256 color --
    let &t_Co=256
    colorscheme pablo
    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Commands
"tabedit " Open vi with tabbed windows enabled

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything

