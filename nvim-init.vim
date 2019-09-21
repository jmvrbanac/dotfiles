if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sickill/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'powerline/powerline-fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

syntax on
colorscheme monokai

set guifont:Inconsolata\ for\ Powerline\ Medium\ 14
set clipboard=unnamedplus
set synmaxcol=500
set incsearch
set hlsearch
set expandtab tabstop=4 shiftwidth=4
set colorcolumn=80
set number
set title
set laststatus=2
set nowrap
set scrolloff=5
set lcs=tab:\|\ ,trail:·
set noscrollbind
set nocursorbind
set cursorcolumn

" Vim Sessions
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Remove trailing spaces on saves
autocmd BufWritePre * :%s/\s\+$//e

" Nerd Tree Settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore=['.pyc$', '\~$', '__pycache__$', '.git$', '.*\.egg.*$', '.tox', '.coverage.*']
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0
set wildmenu
set wildignore+=*.pyc

" Custom filetype settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" let g:indent_guides_exclude_filetypes = ['nerdtree']
" let g:indent_guides_enable_on_vim_startup = 0

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
if has('macunix')
    map <BS> <C-W>h
endif

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

" Snippets
nnoremap <leader>pdb oimport pdb; pdb.set_trace()<Esc>
nnoremap <leader>ipdb oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>pudb oimport pudb; pudb.set_trace()<Esc>
