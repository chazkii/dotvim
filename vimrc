set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-git'
Bundle 'chriskempson/base16-vim'
Bundle 'tpope/vim-surround'
Bundle 'davidhalter/jedi-vim'
Bundle 'bling/vim-airline'
Bundle "pangloss/vim-javascript"
Bundle "Raimondi/delimitMate"
Bundle 'scrooloose/nerdtree'
Bundle 'jalcine/cmake.vim'
Bundle 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
syntax enable

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
" set background=dark
" colorscheme base16-default 
set number
set list
set listchars=tab:>.
autocmd FileType cpp set tabstop=2|set shiftwidth=2|set expandtab
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Enforce not using insert mode for navigation
inoremap kj <Esc>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
set timeoutlen=200
:au FocusLost * :set number
:au FocusGained * :set relativenumber
:set relativenumber
let g:airline_powerline_fonts = 1
set laststatus=2

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Workaround
let g:CommandTTraverseSCM = 'pwd'
let g:clang_user_options='|| exit 0'
