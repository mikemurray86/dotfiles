filetype plugin indent on
set nocp
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nocompatible
nmap <F12> :TagbarToggle<CR>

" ##### Set up Airline #####
set laststatus=2
" let g:airline_powerline_fonts = 1
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
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin for github integration
Plugin 'tpope/vim-fugitive'

call vundle#end()
