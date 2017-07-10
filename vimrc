syntax on
filetype plugin indent on


set nocompatible
set number
set autoread
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set hidden
set fileformat=unix
set fileformats=unix,dos
set viminfo='100,f1
set lazyredraw
set showmatch
set incsearch
set hlsearch
set smartcase
set ignorecase
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set smarttab
set ruler
set rulerformat=%38(%#TabLine#\ %-t\ %m\ %#MatchParen#\ %12(%l:%c%V%)\ %k\ %4p%%%)
set undolevels=1000
set colorcolumn=80
" set textwidth=80
set pastetoggle=<f2>
" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc


highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
highlight ExtraWhitespace ctermbg=grey
match ExtraWhitespace /\s\+$/


" ---------------------- PLUGIN CONFIGURATION ----------------------
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'roman/golden-ratio'
Plugin 'raimondi/delimitmate'
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
call vundle#end()
" -------------------- END PLUGIN CONFIGURATION --------------------


let mapleader = ","
let NERDTreeIgnore = ['\.pyc$']

nnoremap <leader>z :NERDTreeToggle<return>
nnoremap <leader><esc> :noh<return><esc>
nnoremap <leader>l :tabn<return>
nnoremap <leader>h :tabp<return>
nnoremap <leader>n :tabnew<return>
nnoremap <leader>v :vnew<return>


autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim
