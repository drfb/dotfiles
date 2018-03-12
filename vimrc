" Vundle settings
filetype off
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'roman/golden-ratio'
Plugin 'raimondi/delimitmate'
Plugin 'morhetz/gruvbox'
Plugin 'nvie/vim-flake8'
call vundle#end()

" General settings
syntax on
filetype plugin on

set number
set encoding=utf-8
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smarttab
set cursorline
set scrolloff=15
set undolevels=1000
set colorcolumn=80,100

autocmd Filetype html,js setlocal sts=2 sw=2

" Colors
colorscheme gruvbox
set background=dark
" hi ColorColumn ctermbg=darkblue
hi ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/

" Backups and swap management
if !isdirectory(expand("~/.vim/tmp"))
    call mkdir(expand("~/.vim/tmp"), "p")
endif

set backup
set undodir=~/.vim/tmp/
set backupdir=~/.vim/tmp/
set dir=~/.vim/tmp/


" Key mappings
let mapleader = "\<SPACE>"

noremap <SPACE> <Nop>
noremap <Leader>c :noh<CR>
noremap <Leader>l :set nonumber!<CR>
noremap <Leader>t :NERDTreeToggle<CR>
noremap <Leader>f :call Flake8()<CR>
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
noremap <C-H> <C-W>h<C-W>_
noremap <C-L> <C-W>l<C-W>_

" Enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" Airline plugin settings
" Requires pre-patched powerline fonts
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" Nerdtree plugin settings
let NERDTreeIgnore = ['\.pyc$']

" Flake8 plugin settings
autocmd BufWritePost *.py call Flake8() " Run Flake8 check in every writes
