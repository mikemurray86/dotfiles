set nocompatible		            " Make VIM work properly
filetype off						" Needed for Vundle
" # Configure Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin for github integration
Plugin 'tpope/vim-fugitive'
" Plugin for a good status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()

filetype on				            " Enable filetype detection
filetype indent on		            " Enable filetype-specific indenting
filetype plugin on		            " Enable filetype-specific plugin loading 
syntax on				            " Enable Syntax highlighting
set tabstop=4
set softtabstop=4		            " Make tabs of all kinds 4 spaces wide
set shiftwidth=4
set noexpandtab
set showmatch			            " highlight matching brackets 

nmap <F12> :TagbarToggle<CR>        " Set F12 to toggle the tagbar on or off
imap ;; <Esc>

" ##### Set up Airline #####
set laststatus=2
let g:airline_theme='serene'

:augroup prog_lang
:autocmd!
:autocmd BufEnter,FileType *
\    if &ft ==# 'c' || &ft ==# 'cpp' || &ft ==# 'python' | 
\        colorscheme jellybeans |
\        set number |
\    else | 
\        colorscheme zellner |
\    endif
:augroup END

