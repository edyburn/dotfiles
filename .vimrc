" Keith Edyburn's .vimrc

" TODO: bind "spell! spell?" to toggle spellcheck
set nocompatible	" ensure vi compatibility is disabled

" activate pathogen to load plugins from ~/.vim/bundle
filetype off	" force reloading *after* pathogen loaded
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on	" enable detection, plugins and indenting in one step

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden		" allows hiding of buffers so they don't need to be
				"   saved before opening another file
set tabstop=4		" tab as four spaces
set expandtab		" expands tabs into spaces
set softtabstop=4	" when hitting <BS>, pretend like a tab is removed, even if spaces
set backspace=indent,eol,start	" allow backspacing everything in insert mode
set autoindent		" always autoindent
set copyindent		" copy previous indent structure
set shiftwidth=4	" use four spaces for autoindenting
set shiftround		" use multiple of shiftwidth with '>' and '<'
set smarttab		" insert tabs according to shiftwidth
set showmatch		" show matching parens
set ignorecase		" ignore case when searching
set smartcase		" ignore case if all lowercase, otherwise be case-sensitive
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type
" set mapping for clearing search higlight
nmap <silent> <leader>/ :nohlsearch<CR>
set wildmenu        " make tab completion for files/buffers act like bash
set wildmode=list:full  " show a list when pressing tab and complete
                        "    first full match
set wildignore=.DS_Store,*.pyc	" ignore when completing filenames
set title			" set the terminal's title

set foldmethod=indent   " enable code folding based on indent
set foldlevel=99

set nobackup		" disable vim's backup
set noswapfile		" disable vim's swapfile

set nolist			" hide invisible characters (shown based on filetype)
" sets what will be displayed when invisible characters are shown
set listchars=tab:>·,trail:·,extends:#,nbsp:·

if has('autocmd')
	autocmd filetype python setlocal list
	autocmd filetype javascript,css setlocal list
	autocmd filetype html,xml setlocal list
	autocmd filetype html,xml setlocal listchars-=tab:>.
	autocmd filetype rst setlocal list
	autocmd filetype javascript,css,less,jade,typescript,elm setlocal list
	autocmd filetype javascript,html,css,less,jade,yaml,typescript,htmldjango setlocal tabstop=2
	autocmd filetype javascript,html,css,less,jade,yaml,typescript,htmldjango setlocal softtabstop=2
	autocmd filetype javascript,html,css,less,jade,yaml,typescript,htmldjango setlocal shiftwidth=2
endif

" TypeScript integration stuff
" TODO: Generalize this somehow?
" let g:tsuquyomi_use_dev_node_module = 2
" let g:tsuquyomi_tsserver_path = '/home/keith/.../node_modules/.bin/tsserver'
" autocmd FileType typescript nmap <buffer> <Leader>t :
"         \ <C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript let g:SuperTabDefaultCompletionType = "context"
autocmd FileType typescript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType typescript setlocal completeopt=menu,preview,longest
" autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
" autocmd FileType typescript nmap <buffer> <Leader>f <Plug>(TsuquyomiQuickFix)
" autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)

" disable background color erase
set t_ut=

set t_Co=256
if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
	" switch syntax highlighting on, when the terminal has colors
	syntax on
endif

set pastetoggle=<C-P>	" toggle paste mode with F2

set nonumber	" start with line numbers off
" set a shortcut to toggle line numbers
nmap <silent> <leader>ln :set invnumber<CR>

" remap ';' to ':' to speed up typing commands
nnoremap ; :

" toggle HexManager plugin with leader-hm
nmap <silent> <leader>hm <Plug>HexManager<CR>

" since 'python' is python3 on Arch Linux, override executable name
if system('python -c "import sys; print(sys.version_info.major)"') == 3
    let g:syntastic_python_python_exe="python2"
endif

if has("python")
    " Add the virtualenv's site-packages to vim path
    runtime python_virtualenv_fix.vim
endif

