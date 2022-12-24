-- ----------------------------------------------------------------------------
-- PLUGINS: see `:help load-plugins`
-- ----------------------------------------------------------------------------
-- auto-loaded and configured by
--  .config/nvim/lua/packer.lua - which establishes the plugins and dependencies
--  .config/nvim/after/plugin/* - configurations run after plugin load
--  see 

-- ----------------------------------------------------------------------------
-- OPTIONS: see `:help vim.o`
-- ----------------------------------------------------------------------------
vim.cmd 'colorscheme kanagawa'

vim.g.mapleader       = " "            -- map leader to <space> 
vim.g.maplocalleader  = " "            -- map local leader to <space> 
vim.o.autoindent      = true
vim.o.background      = 'dark'
vim.o.backspace       = 'indent,eol,start'
vim.o.clipboard       = 'unnamedplus' 
vim.o.cursorline      = true            
vim.o.encoding        = 'UTF-8'
vim.o.expandtab       = true          -- spaces over tabs
vim.o.hidden          = true          -- allow background buffers 
vim.o.hlsearch        = true          -- highlight found searches
vim.o.ignorecase      = true        
vim.o.inccommand      = 'split'       -- get preview of replacements
vim.o.incsearch       = true          -- show match while typing
vim.o.mouse           = 'a'           -- turn on mouse usage
vim.o.number          = true
vim.o.relativenumber  = true          -- hybrid number scheme
vim.o.ruler           = true
vim.o.shiftwidth      = 2
vim.o.smartindent     = true
vim.o.smarttab        = true
vim.o.softtabstop     = 2
vim.o.spell           = false
vim.o.spelllang       = 'en_us'
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.o.tabstop         = 2
vim.o.termguicolors   = true
vim.o.wrap            = false
vim.o.undofile        = true          -- Save undo history
vim.o.breakindent     = true          -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
vim.o.smartcase       = true          -- Case insensitive searching UNLESS /C or capital in search
vim.wo.signcolumn     = 'yes'         -- always
vim.o.completeopt     = 'menuone,noselect'  -- completion: menuone=Use the popup menu also when there is only one match. noselect=force the user to select

-- ----------------------------------------------------------------------------
-- AUTOCOMMANDS
-- ----------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })


-- ----------------------------------------------------------------------------
-- KEY MAPPINGS: note <leader> key maps moved to WHICH KEY plugin lua file
-- ----------------------------------------------------------------------------
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



