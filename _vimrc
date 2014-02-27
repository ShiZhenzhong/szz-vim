" Basic configs

    " Load all customized functions {
    if filereadable(expand("~/_vimrc.functions"))
        so ~/_vimrc.functions
    endif
    "}

set nocompatible              " be iMproved, required
filetype on                  " required
filetype indent on

set rnu " relative number help more
set nu  " Display real line number for the current line
set ai
set background=light
set mouse=a
set mousehide "hide mouse cursor when typing
set shm=flnrwxoOI
set vop=cursor,folds,unix,options
set history=500
set spell
set hid  
set cursorline " highlight the current line
set ve=onemore
" Tab
set expandtab
set tabstop=8
set shiftwidth=4 
set softtabstop=4
set linespace=0

set backspace=indent,eol,start 

set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmenu " show alternative list
set wildmode=full
set whichwrap=b,s,h,l,<,>,[,]

set scrolljump=5
set scrolloff=3

set listchars+=tab:>-,trail:^,extends:>,precedes:<

scriptencoding utf-8
syntax enable
highlight clear SignColumn
highlight clear LineNr

if has('cmdline_info')
    set ru
    set ruf=%15(%c%V\ %p%%%)
    set showcmd
endif

if has('statusline')
    set laststatus=2   " make statusline always shown

    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Plugins start here
" let Vundle manage Vindle, required
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/_vim/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required

" color 
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized             " Load a colorscheme
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    let g:solarized_menu=0
else
    color desert
endif
