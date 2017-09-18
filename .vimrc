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
nnoremap <C-space> :nohl<CR>
vnoremap <C-space> :nohl<CR>
inoremap <C-space> <ESC>:nohl<CR>i

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set foldmethod=indent
set foldlevel=99
filetype on

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview



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

" VIM Python as an IDE
" https://github.com/mbrochh/vim-as-a-python-ide
" https://www.youtube.com/watch?v=YhqsjUUHj6g

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

" allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
