" NVIM config file


" Plugins BEGIN - plugin manager, and plugin install
call plug#begin('~/.local/share/nvim/site/autoload')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Conquer of Completion (with full LSP support, like VSCode)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Go Language support (`:GoBuild`,`:GoInstall`, `GoDebugStart`, `GoTest` ...)
" Plug 'fatih/vim-go'

" Install fzf to search for files
" commands here: https://github.com/junegunn/fzf.vim#commands
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP Config
"
Plug 'neovim/nvim-lspconfig'
Plug 'rust-lang/rust.vim'


" File explorer
Plug 'preservim/nerdtree'

" A personal wiki
Plug 'vimwiki/vimwiki'


" NeoGit ?
"
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'


" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'tomlion/vim-solidity'

call plug#end()
" Plugins END

" By default use spaces insted of tabs at a 4 width
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent


" Show absolutee numbers on the righte
set number
set signcolumn=no
set nobackup
set nowritebackup
set noswapfile


set guioptions-=T
set visualbell

" write the file to disk when :bnext ..
set autowrite

" 2=indent, eol, start
" allow backspace over autoindent, line breaks,
" and the start of insert block
set bs=2


syntax on

set fo-=t
" set colorcolumn=80

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
nmap <leader>2 :color nord<CR>
nmap <leader>3 :color pulumi<CR>
nmap <leader>4 :color gruvbox<CR>


nmap <leader>q :%s/\s\+$//g<CR>
nmap <leader>s :mksession!<CR>
nmap <leader>S :wall<CR>:mksession!<CR>:qall<CR>

vnoremap < <gv
vnoremap > >gv

set hlsearch
nnoremap <leader>n :nohl<CR>
vnoremap <leader>n :nohl<CR>
inoremap <C-space> <ESC>:nohl<CR>i

filetype off
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

set foldmethod=indent
set foldlevel=99
filetype on
filetype plugin on
filetype indent on


au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m



" Add the virtualenv's site-packages to vim path
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    # with open(activate_this) as source_file:
    #     exec(source_file.read())
EOF

"// ;# http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide



au InsertLeave * match ExtraWhitespace /\s\+$/
set t_Co=256
color gruvbox
" color desert
highlight ColorColumn ctermbg=24 guibg=#080201
highlight ExtraWhitespace ctermbg=49 guibg=#00ff00
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=49 guibg=#9988BB
autocmd ColorScheme * highlight ColorColumn guibg=#0c0c0c

" VIM Python as an IDE
" https://github.com/mbrochh/vim-as-a-python-ide
" https://www.youtube.com/watch?v=YhqsjUUHj6g

set guifont="DejaVu Sans Mono"
set ruler
" set cursorline
highlight CursorLine cterm=bold

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


set splitright
set splitbelow

" allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

set path+=**




" Quick fix window navigation and open and close
nnoremap <C-n> :cn<CR>
nnoremap <C-m> :cp<CR>
nnoremap <C-N> :copen<CR>
nnoremap <C-M> :close<CR>


nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

set exrc


" enable LanguageClient_Neovim for rust
"
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
            \ 'go': ['gopls'],
            \}

" shortcuts for rust navigations
nnoremap <leader>rg :call LanguageClient_textDocument_definition()


" " leader b to select between buffers
" let g:ctrlp_map = '<leader>b'
" nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>B :CtrlPBufferMRU<CR>
" nnoremap <leader>f :CtrlP<CR>



" OLD vim-go configuration:
"
" "
" " Go setup
" "
" let g:go_fmt_command = "goimports"
" let g:go_gocode_propose_source = 0
" let g:goauto_type_info = 1
" let g:go_version_warning = 0
"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 0
" let g:go_highlight_operators = 1
" let g:go_metalinter_autosave = 1
" "let g:go_metalinter_autosave_enabled = 1

" "
" " Shortcuts to use with govim
" nnoremap <leader>gh :GoDoc<CR>
" nnoremap <leader>gtf :GoTestFunc<CR>
" nnoremap <leader>gtt :GoTest<CR>
" nnoremap <leader>gd :GoDebug<CR>
" nnoremap <leader>gi :GoInfo<CR>



"
" Rust setup
"
let g:rustfmt_autosave = 1
:packadd termdebug
let g:termdebugger="rust-gdb"


"
" Go setup
"
" -- to autoformat on write
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
autocmd BufWritePre *.go lua GoOrgImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()



"
" Fzf
"
"
" " leader b to select between buffers
" let g:ctrlp_map = '<leader>b'
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :Rg

"
" NERDTree
"
nnoremap <leader>nt :NERDTree<CR>

" don't know how, <CR> closes the buffer
nnoremap <CR> j


let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
