vim.fn['plug#begin']('~/.local/share/nvim/site/autoload')

local Plug = vim.fn['plug#']

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

-- Install fzf to search for files
-- commands here: https://github.com/junegunn/fzf.vim#commands
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')

-- LSP Config
--
Plug 'neovim/nvim-lspconfig'
Plug 'rust-lang/rust.vim'

-- Autocomplete
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"

-- File explorer
Plug 'preservim/nerdtree'

-- A personal wiki
Plug 'vimwiki/vimwiki'


-- NeoGit ?
--
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'


Plug 'tomlion/vim-solidity'

-- Telescope
--
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

-- TreeSitter
Plug 'nvim-treesitter/nvim-treesitter'

-- Themes
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'
Plug 'cocopon/iceberg.vim'
Plug 'savq/melange-nvim'
Plug 'sainnhe/sonokai'

-- Python development
Plug 'jose-elias-alvarez/null-ls.nvim'


-- Go development
Plug 'olexsmir/gopher.nvim'

vim.fn['plug#end']()

