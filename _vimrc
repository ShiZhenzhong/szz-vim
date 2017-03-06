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
    if filereadable(expand("/usr/share/dict/words"))
        set dictionary = "/usr/share/dict/words"
    endif
    set guifont=Monospace\ 12
endif

if WINDOWS()
    if filereadable(expand("~/_vimrc.util"))
        so ~/_vimrc.util
    endif
    if filereadable(expand("~/words"))
        set dictionary = "~/words"
    endif
    set guifont=Courier_New:h12:cANSI
endif
"}}}

" General Settings {{{
set visualbell
set smarttab

set rnu " relative number help more
set nu  " Display real line number for the current line
set numberwidth=1
set ai
set mouse=a
set mousehide "hide mouse cursor when typing
set shortmess=flnrwxoO
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

"set wildignorecase
set wildmode=longest,list,full
set wildmenu
set whichwrap=b,s,h,l,<,>,[,]

set scrolljump=5
set scrolloff=3
set foldlevel=10

set listchars+=tab:>-,trail:^,extends:>,precedes:<
set pastetoggle=<F12>
set completeopt=longest,menuone

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
scriptencoding utf-8
set encoding=utf-8
syntax enable
highlight clear SignColumn
highlight clear LineNr

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set langmenu=zh_CN.utf-8
endif

if has('cmdline_info')
    set ru
    set ruf=%15(%c%V\ %p%%%) " ruler format
    set showcmd
endif

if has('statusline')
    set laststatus=2   " make statusline always shown

    set statusline=%<%f\:                    " Filename
    set statusline+=%-5.3n\                 " buffer number
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

let mapleader=","
call InitDirectories()

"}}}

"Akey mappings {{{
inoremap jk <esc>
inoremap <C-s> <esc>:w<CR>
"inoremap <C-e> <esc>$a
"inoremap <C-a> <esc>^i
nnoremap ; :
nnoremap <Leader>fs :set guifont=*<CR>
inoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
nnoremap <leader>ev <esc>:vsplit $MYVIMRC<CR>
noremap Y y$
nnoremap zl zL
nnoremap zh zH
nnoremap <S-space> <esc>mi:%s/\s\+$//g<CR>`i
noremap <leader><space> :noh<CR>
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

"Gundo
nnoremap <F6> :GundoToggle<CR>
let g:gundo_width = 50
let g:gundo_preview_height = 40

cmap cwd lcd %:p:h
cmap <C-a> <HOME>

"SuperTab
"let g:SuperTabDefaultCompletionType = "context"

"Session management
let g:session_autosave='no'
let g:session_autoload = 'no'

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = "<C-N>"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:use_jedi_for_javascript=0

let g:tern_map_keys=1
let g:tern_show_argument_hints='no'

let g:ctrlp_root_markers = ['.ctrlp'] " create a .ctrlp file at the root directory in big project. and remember add this file to .git_ignore

let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'
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

let g:used_javascript_libs = 'underscore,backbone,jquery'

let g:snips_author='shizhz'
let g:snips_email='messi.shizz@gmail.com'
let g:snips_github='https://github.com/shizhz'
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['html'] = 'html,javascript,css,jinja2'


"}}}

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-n>'
let g:user_emmet_mode='a'
let g:use_emmet_complete_tag = 1

let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_disable_two_key_combo = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#data_directory = "~/.vim/.cache/neocomplete"
let g:neocomplete#enable_insert_char_pre = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" fugitive
nnoremap <leader>gs  :Gstatus<CR>

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"}}}

" Abbreviations {{{
iabbrev @@ messi.shizz@gmail.com
"}}}

" autocmd {{{
if has('autocmd')
    au FileType vim setlocal foldmethod=marker
    au FileType vim noremap <leader>so :so %<CR>

    au FileType python setlocal foldmethod=indent foldlevel=4
    au FileType python setlocal omnifunc=jedi#completions

    " Use jedi's trigger method
    "au FileType javascript inoremap <silent> <buffer> . .<C-R>=jedi#complete_string(1)<CR>
    "au FileType javascript inoremap <expr> <buffer> <C-n> jedi#complete_string(0)
    "au FileType javascript call ReadJediConfigForJS()
    au FileType javascript nnoremap <silent> <buffer> K <esc>:TernDoc<CR>
    " close any preview windows
    au FileType javascript nnoremap <silent> <buffer> <esc> <C-W>z
    autocmd FileType vim set keywordprg=":help"

    au FileType css imap <C-n> <C-x><C-o>
    au FileType html,css EmmetInstall
    au BufRead,BufNewFile *.less set filetype=CSS

    au InsertLeave <buffer> if pumvisible() == 0|pclose|endif
"    au BufEnter * silent! lcd %:p:h
    au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace //

    autocmd FileType javascript noremap <buffer>  <leader><Leader>f :call JsBeautify()<cr>
    autocmd FileType html noremap <buffer> <leader><Leader>f :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <leader><leader>f :call CSSBeautify()<cr>
    autocmd FileType javascript vnoremap <buffer>  <leader><leader>f :call RangeJsBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <leader><leader>f :call RangeHtmlBeautify()<cr>
    autocmd FileType html setlocal foldmethod=indent foldlevel=20
    autocmd FileType css vnoremap <buffer> <leader><leader>f :call RangeCSSBeautify()<cr>
endif "}}}

" Plugins {{{
filetype off                  " required
set rtp+=$HOME/.vim/bundle/vundle
call vundle#begin()

" Plugin 'tpope/vim-rails.git'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'othree/javascript-libraries-syntax.vim'
" vim-snipmate
"Plugin "MarcWeber/vim-addon-mw-utils"
"Plugin "tomtom/tlib_vim"
"Plugin "garbas/vim-snipmate"
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'sjl/gundo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'skammer/vim-css-color'
Plugin 'shizhz/auto-pairs'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
"Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
" Plugin 'klen/python-mode'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-unimpaired'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

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
nnoremap <C-S-p> :CtrlP<CR>
nnoremap <C-S-t> :CtrlPTag<CR>
nnoremap <C-S-b> :CtrlPBuffer<CR>

nnoremap <leader>tt :TagbarToggle<CR>

" Bufexplorer
noremap <silent> <leader>ll :BufExplorer<CR>
noremap <silent> <leader>lb :BufExplorerVerticalSplit<CR>

" neartree
map <silent> <C-E> :NERDTreeToggle<CR>

" easymotion
map \ <Plug>(easymotion-prefix)
map \\s <Plug>(easymotion-s2)
map \g <Plug>(easymotion-sn)

" session
nnoremap <leader>ssl :ViewSession<CR>
nnoremap <leader>ss :SaveSession<CR>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <leader>so :OpenSession<CR>

imap <CR>   <C-R>=CustomizeCR()<CR>

" golang

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)

" Syntasic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pylint','pep8']
"autopep8
let g:autopep8_max_line_length=79
let g:autopep8_disable_show_diff=1

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:neosnippet#disable_runtime_snippets = { "_": 1, }
