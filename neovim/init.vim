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

" Enable file specific behavior like highlighting and indentation
filetype on
filetype plugin on
filetype indent on

" Map esc to jj in insert mode
:imap jj <Esc>

call plug#begin('~/.config/nvim/plugged')
" vim-fugitive
" Plug 'tpope/vim-fugitive'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

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
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
