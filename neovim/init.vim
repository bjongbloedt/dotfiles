" VIM Configuration -- Ben Jongbloedt

syntax enable
set encoding=utf-8
set hidden

" Display
set title
set number
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

" vim-bufferline
Plug 'bling/vim-bufferline'

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" Tree
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

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
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', { 'for': ['javscript', 'javascript.jsx']}
call plug#end()

" NERDTree
let g:NERDTreeHijackNetrw=0
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'], [ 'filename' ], [ 'bufferline' ] ],
    \ },
    \ 'component': {
    \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
    \   }
    \ }

" Color
set background=dark
colorscheme solarized

" neomake
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_javascript_enabled_markers = ['eslint']

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
