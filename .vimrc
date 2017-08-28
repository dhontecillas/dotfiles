set tabstop=4
set shiftwidth=4
set expandtab
set number
set nobackup
set nowritebackup
set noswapfile
set autoindent
set guioptions-=T
set visualbell
set autowrite
set bs=2
syntax on

set nowrap
set fo-=t
set colorcolumn=80

set hlsearch
set incsearch
set ignorecase
set smartcase

autocmd! bufwritepost .vimrc source %
set clipboard=unnamed
set mouse=a

let mapleader=','

map <leader>l <c-w>l
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k

nmap <leader>1 :color wombat256<CR>
nmap <leader>2 :color desert<CR>

nmap <leader>q :%s/\s\+$//g<CR>

vnoremap < <gv
vnoremap > >gv

set hlsearch
" TODO: fix the remove highlights shortcuts
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

filetype off

" "enable this if pathogen plugin is installed
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

set foldmethod=indent
set foldlevel=99
filetype on

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
nmap <leader>a <Esc>:Ack!

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

"// ;# http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide

au InsertLeave * match ExtraWhitespace /\s\+$/
set t_Co=256
color wombat256
highlight ColorColumn ctermbg=24 guibg=#080201
highlight ExtraWhitespace ctermbg=49 guibg=#00ff00
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=49 guibg=#9988BB
autocmd ColorScheme * highlight ColorColumn guibg=#0c0c0c

set guifont=PT_Mono:h14
set ruler
set cursorline

" set showcmd
" filetype indent on
" set wildmenu
set lazyredraw

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

set wrap
nnoremap j gj
nnoremap k gk

" VIM Python as an IDE
" https://github.com/mbrochh/vim-as-a-python-ide
" https://www.youtube.com/watch?v=YhqsjUUHj6g
