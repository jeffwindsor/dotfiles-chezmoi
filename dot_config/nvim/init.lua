-- ============================================================================
-- PLUGINS : explicit loading. 
--  for auto loading, move source files to .config/nvim/after/plugin/*.lua 
--  see :help load-plugins for more info
-- ============================================================================
require 'plugins.packer' -- done first by design

require 'plugins.auto-save'
require 'plugins.indent-blankline'
require 'plugins.lualine'
require 'plugins.material-nvim'
require 'plugins.nvim-treesitter'
require 'plugins.telescope'
require 'plugins.which-key'

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.autoindent      = true
vim.opt.background      = 'dark'
vim.opt.backspace       = 'indent,eol,start'
vim.opt.clipboard       = 'unnamedplus' 
vim.opt.cursorline      = true            
vim.opt.encoding        = 'UTF-8'
vim.opt.expandtab       = true          -- spaces over tabs
vim.opt.hidden          = true          -- allow background buffers 
vim.opt.hlsearch        = true          -- highlight found searches
vim.opt.ignorecase      = true        
vim.opt.inccommand      = 'split'        -- get preview of replacements
vim.opt.incsearch       = true           -- show match while typing
vim.opt.mouse           = 'a'           -- turn on mouse usage
vim.opt.number          = true
vim.opt.relativenumber  = true          -- hybrid number scheme
vim.opt.ruler           = true
vim.opt.shiftwidth      = 2
vim.opt.smartindent     = true
vim.opt.smarttab        = true
vim.opt.softtabstop     = 2
vim.opt.spell           = false
vim.opt.spelllang       = 'en_us'
vim.opt.splitbelow      = true
vim.opt.splitright      = true
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.wrap            = false


-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })


-- ============================================================================
-- KEY MAPPINGS: note <leader> key maps moved to WHICH KEY plugin lua file
-- ============================================================================
local noremap = { noremap = true }                -- protects from remapping by other configs
local silent  = { noremap = true, silent = true } -- silent does not show bound command in bottom row / command output

-- PERSONAL home row improvements
--  quick <jk> produces an <escape> while in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', silent)   

--  buffer movement direct from CONTROL home row keys
--    left / right for tabs 
vim.api.nvim_set_keymap("n", "<C-h>", "tabprev", silent)
vim.api.nvim_set_keymap("n", "<C-l>", "tabnext", silent)
--    up / down for buffers
vim.api.nvim_set_keymap("n", "<C-j>", "bprev", silent)
vim.api.nvim_set_keymap("n", "<C-k>", "bnext", silent)

--  first character in line
vim.api.nvim_set_keymap("n", "H", "^", silent)

--  last character in line
vim.api.nvim_set_keymap("n", "L", "$", silent)

--  return removes search highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- PERSONAL muscle memory improvements
--  command mode without the shift key (normal and visual mode)
vim.api.nvim_set_keymap('n', ';', ':', noremap)
vim.api.nvim_set_keymap('v', ';', ':', noremap)

--  yank acts like other capitol letters (normal mode)
vim.api.nvim_set_keymap('n', 'Y', 'y$', noremap)



vim.cmd 'colorscheme kanagawa'
