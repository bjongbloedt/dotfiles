" VIM Configuration -- Ben Jongbloedt
set encoding=utf-8
set hidden
set termguicolors

" Display
set title
set number
set relativenumber
set ruler
set wrap
set scrolloff=3
set guioptions=T
set expandtab
set smarttab
set colorcolumn=80
set hlsearch

" Remap ; to :
nnoremap ; :

" Setting Spell check
set spell spelllang=en_us


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

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

inoremap jk <esc>

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Ale
Plug 'w0rp/ale'

" theme
Plug 'morhetz/gruvbox'

" lightline
Plug 'itchyny/lightline.vim'

" Closing braces and etc
Plug 'Raimondi/delimitMate'

" vim-bufferline
Plug 'bling/vim-bufferline'

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" Emmet
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'vue']}

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
Plug 'wokalski/autocomplete-flow', { 'for': ['javscript', 'javascript.jsx']}

" Typescript
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}

"Vue
Plug 'posva/vim-vue', {'for': ['vue']}

call plug#end()

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'], [ 'filename' ]],
      \ },
      \ 'component': {
      \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
      \   }
      \ }

" Color
set background=dark
colorscheme gruvbox

" Buffers as tabs
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Fuzzy finder without plugin
" Serach down into subfolders
" Provides tab completion for all file related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

" Make ctags
command! MakeTags !ctags -R .

" Ale Settings
let g:ale_fixers = {
\   'python': ['autopep8'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
