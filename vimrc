" Vundle {{{
filetype off						        " Needed for Vundle
" # Configure Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin for github integration
Plugin 'tpope/vim-fugitive'
" Plugin for a good status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
if has('python')
    Plugin 'SirVer/ultisnips'
else
    Plugin 'garbas/vim-snipmate'
endif
Plugin 'honza/vim-snippets'
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
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
noremap <F9> :NERDTreeToggle<CR>
nnoremap <space> za
nnoremap dtw :%s/\s\+$//ec<CR>
" }}}
" Airline {{{
" ##### Set up Airline #####
set laststatus=2
let g:airline_theme='serene'
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" Autocmd settings {{{
:augroup prog_lang
:autocmd!
autocmd FileType c,cpp,python,ruby colorscheme jellybeans
autocmd FileType vim :setlocal foldmethod=marker
:augroup END
" }}}
