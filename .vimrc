
" Disable vi compatibility
set nocompatible

let g:pathogen_disabled = []

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has( 'gui_running' )
	call add( g:pathogen_disabled, 'css-color' )
endif

call pathogen#infect() 

" Visual goodies
set number " Line numbers
set ruler
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size
set showmatch " Show matching brackets
syntax enable " Enable syntax highlighting without overriding color preferences

set t_Co=256

if has('gui_running')
	set background=light
else
	set background=dark
endif

"colorscheme solarized
colorscheme wombat256

set hidden " Hide buffers instead of closing them

" Plugins
filetype plugin indent on

" Safe work
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/temp " This directory is used to store temporal/swap files.

set viminfo='10,\"100,:20,%,n~/.vim/viminfo
if has( 'autocmd' )
	autocmd BufReadPost *
		\ if line( "'\"" ) > 1 && line( "'\"" ) <= line( '$' ) |
			\ exe "normal! g'\"" |
		\ endif
endif

" Character encoding
set encoding=utf-8
set fileencoding=utf-8

" Search
set incsearch
set hlsearch
set ignorecase " Case insensitive by default
set smartcase " If there are caps, go case-sensitive

" Keyboard mapping
map <C-x> :tabclose<CR>
map <C-n> :tabnew<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>

" Plugin keyboard mapping
map <silent> <F5> :NERDTreeToggle<CR> \
nmap <F8> :TagbarToggle<CR> \
map <C-o> :CtrlP<CR> \

set tags=~/project_tags

