let g:dracula_italic = 0
let g:dracula_colorterm = 0

set nocompatible

" Vim-plug settings
call plug#begin('~/.vim/plugged')
" Tools
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'raimondi/delimitmate'
Plug 'bkad/CamelCaseMotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'on': 'Files' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'mattn/emmet-vim'
Plug 'Dimercel/todo-vim'

" Syntax
Plug 'psf/black', { 'tag': '19.10b0', 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'vue', 'html'] }
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Visuals
Plug 'roman/golden-ratio'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'bling/vim-airline'
Plug 'ap/vim-css-color'

" Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" General settings
syntax on
filetype plugin on
filetype indent on

set number
set encoding=utf-8
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set smarttab
set scrolloff=15
set undolevels=1000
set colorcolumn=80,89
set backspace=2
set pastetoggle=<F2>
set wildmenu
set shortmess=I

autocmd BufRead,BufNewFile *.css,*.scss,*.html,*.js,*.vue,*md,*.yml setlocal sts=2 ts=2 sw=2
autocmd BufRead,BufNewFile *.vue setfiletype html

" Colors
set bg=dark
colorscheme dracula

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
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>ln :set nonumber!<CR>
noremap <Leader>l8 :call Flake8()<CR>
noremap <Leader>lb :Black<CR>
noremap <Leader>li :Isort<CR>
noremap <Leader>p :PrettierAsync<CR>
noremap <Leader>f :Files<CR>
noremap <Leader>i :IndentLinesToggle<CR>
noremap <Leader>t :rightbelow vnew<CR>
noremap <Leader>r :vnew<CR>
noremap <Leader>g :G<CR>
noremap <Leader>v :tabnew<CR>
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
noremap <C-H> <C-W>h<C-W>_
noremap <C-L> <C-W>l<C-W>_
noremap <S-L> $
noremap <S-H> ^
nmap <F3> :TagbarToggle<CR>
nmap <F4> :TODOToggle<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Commands
command W :execute ":silent w !sudo tee % > /dev/null" | :edit!

" Enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" Airline
" Requires pre-patched powerline fonts
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.dirty = '*'

" Nerdtree
let NERDTreeIgnore = [
            \ '\.pyc$',
            \ '__pycache__',
            \ '.git',
            \ '.vscode',
            \ '.DS_Store',
            \ '.cache',
            \ '.tmp',
            \ 'pytest_cache']

" python
let g:python_highlight_all = 1

" CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>') " Default mapping

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" IndentLine
let g:indentLine_conceallevel = 2
let g:indentLine_fileTypeExclude = ['json', 'markdown']

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

let g:ft = ''
fu! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                let syn = tolower(syn)
                exe 'setf '.syn
            endif
        endif
    endif
endfu
fu! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ''
    endif
endfu

" javascript
let g:javascript_plugin_jsdoc = 1

" isort
let g:vim_isort_python_version = 'python3'

" deoplete
let g:deoplete#enable_at_startup = 1

" Vue
let g:vim_vue_plugin_use_sass = 1

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-F>'
autocmd FileType html,css,vue EmmetInstall

" Prettier
let g:prettier#exec_cmd_path = "~/.npm-global/bin/prettier"
let g:prettier#config#html_whitespace_sensitivity = "ignore"
let g:prettier#config#print_width = 100

" todo.vim
let g:todo_vertical = 1

" Tabline
fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' '

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()
