" Vundle {{{
filetype off						        " Needed for Vundle
" # Configure Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin for github integration
Plugin 'Vundle/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin for a good status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
" }}}
" The Basics {{{
set nocompatible		        " Make VIM work properly
filetype on				        " Enable filetype detection
filetype indent on		        " Enable filetype-specific indenting
filetype plugin on		        " Enable filetype-specific plugin loading
syntax on				                " Enable Syntax highlighting
set tabstop=4
set softtabstop=4		        " Make tabs of all kinds 4 spaces wide
set shiftwidth=4
set expandtab                   " Use spaces instead of tab
set showmatch                   " highlight matching brackets
set nohlsearch
colorscheme zellner
" }}}
" Mappings {{{
nnoremap <F12> :TagbarToggle<CR>    " Set F12 to toggle the tagbar on or off
inoremap ;; <Esc>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-L> <C-W><C-W>
noremap <F9> :NERDTreetoggle<CR>
nnoremap <space> za
onoremap tw :%s/\s\+$//e<CR>
" }}}
" Airline {{{
" ##### Set up Airline #####
set laststatus=2
let g:airline_theme='serene'
" }}}
" Autocmd settings {{{
:augroup prog_lang
:autocmd!
autocmd FileType c,cpp,python colorscheme jellybeans set number
autocmd FileType vim :setlocal foldmethod=marker
:augroup END
" }}}
