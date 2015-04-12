" Use bash as vim shell.
set shell=/bin/bash

" Activate pathogen.
filetype off
execute pathogen#infect()
filetype plugin indent on

set nocompatible

" Remapping leader.
let mapleader = ","

" Turn on syntax highlighting.
if has("syntax")
    syntax enable
    syntax sync fromstart
endif

" GUI setings (only tested with MacVim).
if has("gui_running")
    colorscheme solarized

    " Use maximum window size possible.
    set columns=9999 lines=9999

    set guioptions-=r  " Hide right scrollbar.
    set guioptions-=R  " Hide right scrollbar in a vertically split window.
    set guioptions-=l  " Hide left scrollbar.
    set guioptions-=L  " Hide left scrollbar in a vertically split window.
    set guioptions-=T  " Hide toolbar.
endif

" Show the filename in the window titlebar.
set title

" Text width settings.
function! SetTextWidth(width)
    execute "set textwidth=".a:width
    execute "set colorcolumn=".(a:width + 1)
endfunction
call SetTextWidth(79)
autocmd FileType text,tex,markdown,plaintex,context,gitcommit :call SetTextWidth(72)
autocmd FileType rust :call SetTextWidth(99)

" General settings.

" Set formatting options for text blocks.
" FIXME This needs tweaking. :help fo-table
" Default: tcq
set formatoptions=tcqronl1

" Number of spaces that a <Tab> in the file counts for.
set tabstop=8

function! SetIndentation(size)
    " Number of spaces to use for each step of (auto)indent.
    execute "set shiftwidth=".a:size
    " Number of spaces that a <Tab> counts for while performing editing
    " operations, like inserting a <Tab> or using <BS>.
    execute "set softtabstop=".a:size
endfunction
call SetIndentation(4)

" Indentation for specific file formats.
autocmd FileType yaml,json,ruby :call SetIndentation(2)
autocmd FileType ada,rst :call SetIndentation(3)

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Do not make a backup before overwriting a file.
set nobackup

" How much of history of ":" commands, and a history of previous search.
" patterns are remembered.
set history=32

" Sensible file/path/command autocompletion list.
set wildmenu
set wildmode=list:longest,full

" Show (partial) command in the last line of the screen.
set showcmd

" Searches are case-insensitive.
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase

set backspace=indent,eol,start

" Indicates a fast terminal connection.
set ttyfast

" Enable mouse in terminal for all editor modes.
set mouse=a

" Last window always has a status line.
set laststatus=2

" [encoding,file format] help file format, modified flag, read-only
" flag, filetype, left/right separator, cursor column,cursor line/total lines,
" percent through file.
" FIXME Remove/reconfigure after vim-airline?
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Shows the line and column numbers and percentage file position if there is
" room.
set ruler

" Highlight searches (clear with ,/).
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.
set incsearch

" Tell the editor the background is dark (for proper syntax highlighting).
set background=dark

" Disables search wrap around the end of file.
set nowrapscan

" Start scrolling N lines/columns before cursor hits the edge of visible.
" buffer.
set scrolloff=5
set sidescrolloff=5

" set startofline

" Open new horizontal split window below current.
set splitbelow

" Open new vertial window to the right of current.
set splitright

" For GUI, mouse pointer is hidden when characters are typed.
set mousehide

" Unused when textwidth set.
" set wrapmargin=1

" set linebreak
"
" Don’t show the intro message when starting vim.
set shortmess=atI

" Show matching brackets.
" FIXME Probably annoying, test.
set showmatch

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

" Disabling paste on middleclick.
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" Reselect visual after indent/outdent.
" FIXME Probably clashes with my muscle memory, but let's see.
vnoremap < <gv
vnoremap > >gv

" Use normal \t tabs for some file types.
autocmd FileType make,sql,go setlocal noexpandtab

" Toggle paste mode with `,p`.
noremap <leader>p :set invpaste<CR>

" Highlight trailing whitespaces.
match ErrorMsg /\s\+$/

function! CleanWhiteSpace()
    let save_cursor = getpos(".")
    " Remove white spaces from ends of lines.
    :silent! %s#\s\+$##
    " Make sure that there is exactly one newline at the end of the file.
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
noremap <leader>c :call CleanWhiteSpace()<CR>

" Disable folding.
set nofoldenable

" The Magnificent Git Blame.
map <C-T> :Gblame<CR>

" Resize splits when resizing window.
autocmd VimResized * :wincmd =

" Filetype-specific settings.
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Syntastic settings.
let g:syntastic_enable_signs=0
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol="X"
let g:syntastic_warning_symbol="!"

" NERDTree settings.
let NERDTreeShowHidden=1

" vim-airline settings.
let g:airline_theme='dark'

" Test stuff.
" set runtimepath^=~/.vim/bundle/ctrlp.vim
"autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
