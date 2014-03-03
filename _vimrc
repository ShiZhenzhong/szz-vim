" Basic configs {{{
silent function! WINDOWS()
    return has('win16') || has('win32') || has('win64')
endfunction

silent function! LINUX()
    return has('unix') || has('win32unix')
endfunction
"}}}

" Load all customized functions {{{
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
"}}}

" General Settings {{{
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
set autochdir
set foldlevel=10

set listchars+=tab:>-,trail:^,extends:>,precedes:<
set pastetoggle=<F12>
set completeopt=longest,menuone

scriptencoding utf-8
set encoding=utf-8
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
call InitDirectories()

"SuperTab
let g:SuperTabDefaultCompletionType = "context"

" jedi-vim
let g:jedi#completions_command = "<C-N>"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#rename_command = "<leader>jr"
" let g:jedi#call_signature_escape = ' '

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

let g:ctrlp_root_markers = ['.ctrlp'] " create a .ctrlp file at the root directory in big project. and remember add this file to .git_ignore
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|pyc|pdf|PDF|jar|chm|so|dll)$',
	\ 'link': '',
	\ }

let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle=3

let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.
let g:bufExplorerDetailedHelp=0      " Do not show detailed help.
let g:bufExplorerFindActive=1        " Go to active window.


let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['javascript', 'python'] }
"}}}

"key mappings {{{
inoremap <leader>q <esc>
inoremap <C-s> <esc>:w<CR>
inoremap <C-e> <esc>$a
inoremap <C-a> <esc>^i
nnoremap ; :
inoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
nnoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
noremap j gj
noremap k gk
noremap Y y$
nnoremap zl zL
nnoremap zh zH
nnoremap <S-space> <esc>mi:%s/\s\+$//g<CR>`i
noremap <leader><space> :noh<CR>
noremap <leader>so :so %<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <A-j> <esc>:res -10<CR>
noremap <A-k> <esc>:res +10<CR>
noremap <A-h> <esc>:vertical res -10<CR>
noremap <A-l> <esc>:vertical res +10<CR>
noremap <leader>w <C-w>
noremap <A-n> :bn<CR>
noremap <A-p> :bp<CR>
vnoremap > >gv
vnoremap < <gv


cmap cwd lcd %:p:h
"}}}

" Abbreviations {{{
iabbrev @@ messi.shizz@gmail.com
"}}}

" autocmd {{{
if has('autocmd')
    au FileType vim setlocal foldmethod=marker
    au FileType python setlocal foldmethod=indent foldlevel=4
    au BufEnter * silent! lcd %:p:h
    au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace //
endif "}}}

" Plugins {{{
filetype off                  " required
filetype plugin indent on     " required
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kien/ctrlp.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'marijnh/tern_for_vim'
Bundle 'Shutnik/jshint2.vim'
Bundle 'ervandew/supertab'
" Bundle 'Shougo/neocomplete.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'jcrocholl/pep8'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

" color
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized             " Load a colorscheme
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    let g:solarized_italic = 0
    let g:solarized_menu=0
else
    color desert
endif
set background=dark

" CtrlP
nnoremap <leader>r :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Bufexplorer
noremap <silent> <F9> :BufExplorer<CR>
noremap <silent> <A-F9> :BufExplorerVerticalSplit<CR>

" use netrw
map <silent> <C-E> :call ToggleVExplorer()<CR>

" tern for javascript
au FileType javascript noremap <C-CR> :TernDef<CR>
au FileType javascript noremap <A-S-r> :TernRename<CR>

nmap <F8> :TagbarToggle<CR>

" Mappings
"augroup codechecking_map
    "au!
    "au FileType python,javascript nnoremap  <silent><F1> :SyntasticCheck<CR>
    "au FileType python,javascript inoremap  <silent><F1> <C-O>:SyntasticCheck<CR>
    "au FileType python,javascript vnoremap  <silent><F1> :SyntasticCheck<CR>
    "au FileType python,javascript nnoremap  <silent><F2> :lnext<CR>
    "au FileType python,javascript inoremap  <silent><F2> <C-O>:lnext<CR>
    "au FileType python,javascript vnoremap  <silent><F2> :lnext<CR>
    "au FileType python,javascript nnoremap  <silent><F3> :lprevious<CR>
    "au FileType python,javascript inoremap  <silent><F3> <C-O>:lprevious<CR>
    "au FileType python,javascript vnoremap  <silent><F3> :lprevious<CR>
"augroup END
"}}}
