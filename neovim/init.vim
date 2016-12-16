" VIM Configuration -- Ben Jongbloedt

syntax enable
set encoding=utf-8

" -- Display
set title
set number
set ruler
set wrap

set scrolloff=3
set guioptions=T
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set backspace=2
set colorcolumn=80

" Enable file specific behavior like highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Map esc to jj in insert mode
:imap jj <Esc>

" Map the leader key to space
let mapleader="\<SPACE>"

call plug#begin('~/.config/nvim/plugged')
" vim-fugitive
" Plug 'tpope/vim-fugitive'

" Neomake
Plug 'benekastah/neomake'

" theme
Plug 'altercation/vim-colors-solarized'

" lightline
Plug 'itchyny/lightline.vim'

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" Tree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

" You Complete Me
Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'for': 'python'}

" Vim-test
Plug 'janko-m/vim-test'

" ctrlP
Plug 'ctrlpvim/ctrlp.vim'

" Languages
" html / templates
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } " jade support
Plug 'juvenn/mustache.vim', { 'for': 'mustache' } " mustache support

" JavaScript
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support
call plug#end()

" NERDTree
let g:NERDTreeHijackNetrw=0
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

" Color
set background=dark
colorscheme solarized

" neomake
autocmd! BufEnter *.py Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8']

" YCM Settings

" Vim-test settings
let test#python#runner = 'pytest'

"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>t :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

"set listchars=tab:▸\ ,eol:¬\ ,space:▸
"Ctrlp bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
