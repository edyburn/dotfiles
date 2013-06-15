" Keith Edyburn's .vimrc

set nocompatible	" ensure vi compatibility is disabled

" activate pathogen to load plugins from ~/.vim/bundle
filetype off	" force reloading *after* pathogen loaded
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
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
endif

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

set pastetoggle=<F2>	" toggle paste mode with F2

set nonumber	" start with line numbers off
" set a shortcut to toggle line numbers
nmap <silent> <leader>ln :set invnumber<CR>

" remap ';' to ':' to speed up typing commands
nnoremap ; :

