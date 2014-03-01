" Basic configs {
silent function! WINDOWS()
    return has('win16') || has('win32') || has('win64')
endfunction

silent function! LINUX()
    return has('unix') || has('win32unix')
endfunction
"}

" Load all customized functions {
if LINUX()
    if filereadable(expand("~/.vimrc.util"))
        so ~/.vimrc.util
    endif
endif

if WINDOWS()
    if filereadable(expand("~/_vimrc.util"))
        so ~/_vimrc.util
    endif
endif
"}

" General Settings {
set nocompatible              " be iMproved, required
filetype on                  " required
filetype indent on

set rnu " relative number help more
set nu  " Display real line number for the current line
set numberwidth=1
set ai
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
set pastetoggle=<F12>

set foldcolumn=4
set foldmethod=indent
set background=dark

scriptencoding utf-8
syntax enable
highlight clear SignColumn
highlight clear LineNr

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
endif

if has('cmdline_info')
    set ru
    set ruf=%15(%c%V\ %p%%%) " ruler format
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

let mapleader=","
"}

"key mappings {
inoremap <leader>fj <esc>
inoremap <C-s> <esc>:w<CR>a
inoremap <C-e> <esc>$a
inoremap <C-a> <esc>^i
nnoremap ; :
nnoremap <C-s> :w<CR>
inoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
nnoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
noremap j gj
noremap k gk
noremap Y y$
nnoremap zl zL
nnoremap zh zH
nnoremap <leader><C-F> <esc>:%s/\s\+$//g<CR>
noremap <leader><space> :noh<CR>
noremap <C-j>j <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j><C-j> <esc>:res -10<CR>
noremap <C-j><C-k> <esc>:res +10<CR>
noremap <C-j><C-h> <esc>:vertical res -10<CR>
noremap <C-j><C-l> <esc>:vertical res +10<CR>
noremap <leader>w <C-w>

vnoremap > >gv "keep selected area as it is
vnoremap < <gv

cmap cwd lcd %:p:h
"}

" Abbreviations {
iabbrev @@ messi.shizz@gmail.com
"}

" autocmd {
if has('autocmd')
    au FileType vim,javascript setlocal foldmethod=marker foldmarker={,}
    au FileType python setlocal foldmethod=indent foldlevel=4
    au BufEnter * silent! lcd %:p:h
    au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/
    "au BufWritePost $MYVIMRC so $MYVIMRC
endif "}

" Plugins {
filetype off                  " required
filetype plugin indent on     " required
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'

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
"}
