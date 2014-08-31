set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'
Bundle 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
filetype on
filetype plugin indent on
set background=dark
colorscheme solarized
set number
set list
set listchars=tab:>.
if has ('gui_running')
    set transparency=5
    set guifont=Menlo:h12
endif
setlocal spell spelllang=en_au
let Tlist_Auto_Open = 1
autocmd Syntax cpp call EnhanceCppSyntax()
autocmd FileType cpp set tabstop=2|set shiftwidth=2|set expandtab
"http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pyflakes_use_quickfix = 0
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
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
inoremap kj <Esc>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
set timeoutlen=200
:au FocusLost * :set number
:au FocusGained * :set relativenumber
:set relativenumber
