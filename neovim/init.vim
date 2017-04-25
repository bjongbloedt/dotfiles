" VIM Configuration -- Ben Jongbloedt

set encoding=utf-8
set hidden
set termguicolors

" Display
set title
set number
set rnu
set ruler
set wrap
set scrolloff=3
set guioptions=T
set smarttab
set colorcolumn=80
set expandtab

" Language stuff
autocmd Filetype * set tabstop=2| set shiftwidth=2
autocmd Filetype python set tabstop=4| set shiftwidth=4
autocmd BufRead,BufNewFile .babelrc setfiletype json
autocmd BufRead,BufNewFile .eslintrc setfiletype json

" Enable file specific behavior like highlighting and indentation
syntax on
filetype on
filetype plugin on
filetype indent on

" Map the leader key to space
let mapleader="\<SPACE>"

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Neomake
Plug 'benekastah/neomake'

" theme
Plug 'morhetz/gruvbox'

" lightline
Plug 'itchyny/lightline.vim'

" Closing braces and etc
Plug 'Raimondi/delimitMate'

" vim-bufferline
Plug 'bling/vim-bufferline'

" Engine
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" Tree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages
" html / templates
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support
Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', { 'for': ['javscript', 'javascript.jsx']}

" Typescript
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
call plug#end()

" NERDTree
let g:NERDTreeHijackNetrw=0
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'], [ 'filename' ], [ 'bufferline' ] ],
    \ },
    \ 'component': {
    \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
    \   }
    \ }

" Color
set background=dark
colorscheme gruvbox

" neomake
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']

" Buffers as tabs
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/plugged/vim-snippets/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
