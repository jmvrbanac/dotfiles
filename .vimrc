set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'wting/rust.vim'
Plugin 'bufexplorer.zip'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'sickill/vim-monokai'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType Markdown setlocal spell spelllang=en_us
autocmd FileType rst setlocal spell spelllang=en_us

set guifont:Inconsolata\ for\ Powerline\ Medium\ 14

" Hooking up vim clipboard into the system clipboard
set clipboard=unnamedplus
set synmaxcol=500
set incsearch
set hlsearch
set expandtab tabstop=4 shiftwidth=4
set colorcolumn=80
set number
set title
colorscheme monokai
set laststatus=2
set nowrap
set scrolloff=5
set lcs=tab:▸\ ,trail:·

autocmd BufWritePre * :%s/\s\+$//e "remove trailing spaces on saves

set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

" Nerd Tree Settings
let NERDTreeIgnore=['.pyc$', '\~$', '__pycache__$', '.git$', '.*\.egg.*$', '.tox', '.coverage.*']
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0

let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_enable_on_vim_startup = 0

" Syntastic Settings
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol="⚠"
let g:syntastic_style_warning_symbol="⚠"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args=''
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Snippets
nnoremap <leader>pdb oimport pdb; pdb.set_trace()<Esc>

" Mapping Buffer Focus Movement Keys
" nnoremap <silent> <A-Right> <c-w>l
" nnoremap <silent> <A-Left> <c-w>h
" nnoremap <silent> <A-Up> <c-w>k
" nnoremap <silent> <A-Down> <c-w>j
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

let g:airline_powerline_fonts = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

set wildmenu
set wildignore+=*.pyc                            " Python byte code

execute pathogen#infect()


