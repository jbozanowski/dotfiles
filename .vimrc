set nocompatible

call pathogen#infect()

" Syntax stuff.
syntax enable
syntax sync fromstart
filetype on
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:syntastic_enable_signs=0

" General settings.
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent

set ttyfast
set mouse=a

set laststatus=2
set ruler
set showcmd
set wildmenu

set ignorecase
set smartcase
set hlsearch
set incsearch
set background=dark
set nowrapscan
set scrolloff=4
set sidescrolloff=6
set startofline
set splitbelow
set splitright
set mousehide
set textwidth=79
set wrapmargin=1
set linebreak

" Sensible file/path/command autocompletion list.
set wildmenu
set wildmode=list:longest,full

" GUI setings (only tested with MacVim).
if has("gui_running")
    colorscheme solarized
    set guioptions-=r  " hide right scrollbar
    set guioptions-=L  " hide left scrollbar in a vertically split window
    set guioptions-=T  " hide toolbar
endif

" Navigating up/down through very long, wrapped-around lines as if they're a
" regular, multi line block of text.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk 

" Switching between split windows with just ctrl+hjkl.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" The Magnificent Git Blame.
map <C-T> :Gblame<CR>

" Remapping leader.
let mapleader = ","

" Resize splits when resizing window.
autocmd VimResized * :wincmd =

" Disabling paste on middleclick.
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" Test stuff.
" set runtimepath^=~/.vim/bundle/ctrlp.vim
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
