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
set expandtab
set smarttab
set colorcolumn=80
set hlsearch

" List out nbsp, trailing whitespace, and tabs
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

" Remap ; to :
nnoremap ; :

" Setting Spell check
set spell spelllang=en_us

" Language stuff
autocmd Filetype * set tabstop=2| set shiftwidth=2
autocmd Filetype python set tabstop=4| set shiftwidth=4
autocmd BufRead,BufNewFile .babelrc setfiletype json
autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Write to file automatically if :make or :GoBuild is called
set autowrite

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

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'

" Emmet
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'vue']}

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', {'for': ['python']}
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go']}
Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'javascript']}

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

"Golang
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': ['go']}

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

" neomake
autocmd! BufWritePost,BufReadPost * Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']

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

" Use deoplete.
if has("python3")
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_debug = 1
  let g:deoplete#enable_profile = 1
  autocmd CompleteDone * pclose " To close preview window of deoplete automagically"
  call deoplete#enable_logging('DEBUG', '~/deoplete.log')
endif

" Vim-go settings
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
