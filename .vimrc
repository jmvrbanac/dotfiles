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
Plugin 'rhysd/vim-grammarous'
Plugin 'jamshedvesuna/vim-markdown-preview'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'kylef/apiblueprint.vim'
Plugin 'hashivim/vim-terraform'

" Go plugins
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType Markdown setlocal spell spelllang=en_us
autocmd FileType rst setlocal spell spelllang=en_us

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Go Settings
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
" let g:acp_enableAtStartup = 0

" yaml indentation
autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

set guifont:Inconsolata\ for\ Powerline\ Medium\ 14
syntax on

" Put middlefingers for tabs
set emoji
set list
" set listchars=tab:🖕⋅,trail:⋅,nbsp:⋅

" Markdown Preview
let vim_markdown_preview_github=1

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
set lcs=tab:\|\ ,trail:·

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

" VimWiki Settings
let g:vimwiki_list = [{'path': '~/.vimwiki'}]

" Snippets
nnoremap <leader>pdb oimport pdb; pdb.set_trace()<Esc>
nnoremap <leader>ipdb oimport ipdb; ipdb.set_trace()<Esc>

" Mapping Buffer Focus Movement Keys
" nnoremap <silent> <A-Right> <c-w>l
" nnoremap <silent> <A-Left> <c-w>h
" nnoremap <silent> <A-Up> <c-w>k
" nnoremap <silent> <A-Down> <c-w>j
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Disable Arrow Keys
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>

let g:airline_powerline_fonts = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

set wildmenu
set wildignore+=*.pyc                            " Python byte code

execute pathogen#infect()

function! Convert4SpaceTo2Space()
    " Pulled from Reaperhulk's vimrc
    " Convert spaces to tabs first
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
    retab!
    " now you have tabs instead of spaces, so insert spaces according to
    " your new preference
    set tabstop=2
    set shiftwidth=2
    set expandtab
    retab!
endfunction

function! ConvertTabsToSpaces()
    set expandtab
    set tabstop=4
    set shiftwidth=4
    retab!
endfunction
