filetype plugin indent on
set nocompatible
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
nmap <F12> :TagbarToggle<CR>

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

" # Configure Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin for github integration
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

call vundle#end()
