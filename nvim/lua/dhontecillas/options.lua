local api = vim.api
local gopt = api.nvim_set_option
local gmap = api.nvim_set_keymap
local au = api.nvim_create_autocmd

--  By default use spaces insted of tabs at a 4 width
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.number = true
vim.o.signcolumn = 'auto:3' -- was set to 'no'
vim.o.backup = false
vim.o.nowritebackup = true
vim.o.noswapfile = true

-- vim.opt.guioptions:remove {'T'}
vim.o.visualbell = true

-- write the file to disk when :bnext ..
vim.o.autowrite = true

-- 2=indent, eol, start (this is now the default)
-- allow backspace over autoindent, line breaks,
-- and the start of insert block
-- vim.o.bs = 'indent,eol,start'
vim.opt.fo:remove {'t'}
vim.o.colorcolumn = "80"

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- autocmd! bufwritepost .vimrc source %

vim.o.clipboard = 'unnamed'
vim.o.mouse = 'a'

vim.o.hlsearch = true
vim.o.ruler = true
-- vim.o.cursorline = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = true

vim.o.filetype = 'off'

vim.o.lazyredraw = true
-- vim.o.wildmeu = true

vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10
vim.o.foldmethod = 'indent'

-- set the leader key
vim.g.mapleader = ','

-- commands:
vim.cmd('syntax on')
vim.cmd('color sonokai')


gmap('', '<leader>l', '<c-w>l', {})
gmap('', '<leader>h', '<c-w>h', {})
gmap('', '<leader>j', '<c-w>j', {})
gmap('', '<leader>k', '<c-w>k', {})

gmap('n', '<leader>1',  ':color kanagawa-wave<CR>', {})
vim.g.gruvbox_material_background = 'hard'
gmap('n', '<leader>2',  ':color gruvbox-material<CR>', {})
gmap('n', '<leader>3',  ':color iceberg<CR>', {})
gmap('n', '<leader>4',  ':color melange<CR>', {})
gmap('n', '<leader>5',  ':color sonokai<CR>', {})

gmap('n', '<leader>6',  ':color tokyonight-moon<CR>', {})
gmap('n', '<leader>7',  ':color catppuccin-mocha<CR>', {})
gmap('n', '<leader>8',  ':color tokyonight-night<CR>', {})
gmap('n', '<leader>9',  ':color challenger-deep<CR>', {})

gmap('n', '<leader>q', ':%s/\\s\\+$//g<CR>', {})
gmap('n', '<leader>s', ':mksession!<CR>', {})
gmap('n', '<leader>S', ':wall<CR>:mksession!<CR>:qall<CR>', {})

gmap('v', '<', '<gv', { noremap = true })
gmap('v', '>', '>gv', { noremap = true })

gmap('n', '<leader>n', ':nohl', { noremap = true })
gmap('v', '<leader>n', ':nohl', { noremap = true })
gmap('i', '<C-space> <ESC>', ':nohl', { noremap = true })




local file_type_python = function()
    -- vim.api.nvim_set_option('omnifunc', 'pythoncomplete#Complete')
    vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

au('FileType', { pattern = '*.py', callback = file_type_python})
vim.g.SuperTabDefaultCompletionType = "context"
-- vim.g.completeopt = {'menuone', 'longest', 'preview'}
vim.g.completeopt = {'menu', 'menuone', 'noselect'}

vim.g.grepprg = 'rg --vimgrep --no-heading'
-- set grepprg=rg\ --vimgrep\ --no-heading
vim.g.grepformat = '%f:%l:%c:%m,%f:%l:%m'


au('InsertLeave', { pattern = '*', command = 'match ExtraWhitespace /\\s\\+$/'})
vim.g['t_Co'] = 256
-- highlight ColorColumn ctermbg=24 guibg=#080201
-- highlight ExtraWhitespace ctermbg=49 guibg=#00ff00
-- autocmd ColorScheme * highlight ExtraWhitespace ctermbg=49 guibg=#9988BB
-- autocmd ColorScheme * highlight ColorColumn guibg=#0c0c0c

-- " set cursorline
-- highlight CursorLine cterm=bold

gmap('n','<space>', 'za', { noremap = true })

vim.o.wrap = true
gmap('n', 'j', 'gj', { noremap = true })
gmap('n', 'k', 'gk', { noremap = true })

-- !?
vim.g.path = {'**'}

-- Quick fix window navigation and open and close
gmap('n', '<C-n>', ':cn<CR>', { noremap = true })
gmap('n', '<C-m>', ':cp<CR>', { noremap = true })
gmap('n', '<C-N>', ':copen<CR>', { noremap = true })
gmap('n', '<C-M>', ':close<CR>', { noremap = true })


gmap('n', '<C-j>', '<C-f>', { noremap = true })
gmap('n', '<C-k>', '<C-b>', { noremap = true })

-- execute the local dir .nvimrc
-- vim.g.exrc = true


-- enable LanguageClient_Neovim for rust
--
vim.g['LanguageClient_serverCommands'] = {
    rust = {'rust-analyzer'},
    go = {'gopls', 'null_ls'},
    python = {'pyright', 'null_ls'},
}

-- shortcuts for rust navigations
gmap('n', '<leader>rg', ':call LanguageClient_textDocument_definition()', { noremap })


--
-- Rust setup
--
vim.g.rustfmt_autosave = 1
vim.cmd('packadd termdebug')
vim.g.termdebugger='rust-gdb'


--
-- Go setup
--
au('BufWritePre', { pattern = { "*.go" }, 
    callback = function(ev)
        vim.lsp.buf.format()
    end
})

-- au('BufWritePre', {command = 'lua vim.lsp.buf.format()'})

-- local auto_go_org_imports = function()
--     GoOrgImports(1000)
-- end
-- au('BufWritePre', {
--     pattern = { '*.go' },
--     callback = auto_go_org_imports,
-- })

--
-- Fzf
--
gmap('n', '<leader>fb', ':Buffers<CR>', { noremap = true})
gmap('n', '<leader>ff', ':Files<CR>', { noremap = true})
gmap('n', '<leader>fr', ':Rg<CR>', { noremap = true })

--
-- NERDTree
--
gmap('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true })
gmap('n', '<leader>ntf', ':NERDTreeFocus<CR>', { noremap = true })
gmap('n', '<leader>ntt', ':NERDTree<CR>', { noremap = true })

--
-- Telescope
--
gmap('n', '<leader>tff', '<cmd>Telescope find_files<cr>', { noremap = true })
gmap('n', '<leader>tfr', '<cmd>Telescope live_grep<cr>', { noremap = true })
gmap('n', '<leader>tfb', '<cmd>Telescope buffers<cr>', { noremap = true })
gmap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- don't know how, <CR> closes the buffer
gmap('n', '<CR>', 'j', { noremap = true })


vim.g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)


au('BufWritePre', { pattern = { '*.py' }, callback = vim.lsp.buf.format })
