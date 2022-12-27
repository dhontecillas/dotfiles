vim.fn['plug#begin']('~/.local/share/nvim/site/autoload')

local Plug = vim.fn['plug#']

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

-- Install fzf to search for files
-- commands here: https://github.com/junegunn/fzf.vim#commands
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug 'junegunn/fzf.vim'

-- LSP Config
--
Plug 'neovim/nvim-lspconfig'
Plug 'rust-lang/rust.vim'


-- File explorer
Plug 'preservim/nerdtree'

-- A personal wiki
Plug 'vimwiki/vimwiki'


-- NeoGit ?
--
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'

-- Telescope
--
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

-- Themes
Plug 'arcticicestudio/nord-vim'
Plug 'tomlion/vim-solidity'
Plug 'morhetz/gruvbox'

vim.fn['plug#end']()
