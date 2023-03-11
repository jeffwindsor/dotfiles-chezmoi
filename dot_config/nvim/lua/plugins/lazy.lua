-- ----------------------------------------------------------------------------
--bootstrap plugin manager if not installed
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  'git',
  'clone',
  '--filter=blob:none',
  'https://github.com/folke/lazy.nvim.git',
  '--branch=stable', -- latest stable release
  lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------
-- load plugins
-- ----------------------------------------------------------------------------
require('lazy').setup({

  -- auto save on focus change
  { 'pocco81/auto-save.nvim',
    config = function() require('plugins.auto-save') end },

  -- swiss army knife of plugins
  { 'echasnovski/mini.nvim',
    config = function() require('plugins.mini') end,
    version = '*'},

  -- vertical line hints for indentation
  { 'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end },

  -- fuzzy finder
  { 'nvim-telescope/telescope.nvim',
    config = function() require('plugins.telescope') end,
    dependencies = {'nvim-lua/plenary.nvim'},
    version = '*'},

  -- key bindings popup menu
  { 'folke/which-key.nvim',
    config = function() require('plugins.which-key') end },

  -- file manager
  { 'nvim-tree/nvim-tree.lua',
    config = function() require('plugins.nvim-tree') end,
    dependencies =  { 'nvim-tree/nvim-web-devicons' }},

  -- LSP Configuration & Plugins
  { 'neovim/nvim-lspconfig',
    config = function() require('plugins.nvim-lsp') end,
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', { 'j-hui/fidget.nvim', opts = {} }, 'folke/neodev.nvim', }},

  -- Autocompletion
  { 'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp') end,
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }},

  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end,
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }},

  -- auto adjust the tab length based on current files usage
  { 'tpope/vim-sleuth' },

  -- show git gutter
  { 'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end },

  -- --------------------------------------------------------------------------
  -- color schemes
  -- --------------------------------------------------------------------------
  {'folke/tokyonight.nvim', lazy = true},
  {'joshdick/onedark.vim', lazy = true},
  {'marko-cerovac/material.nvim', lazy = true},
  {'mhartington/oceanic-next', lazy = true},
  {'rebelot/kanagawa.nvim', lazy = true},
  {'shaunsingh/nord.nvim', lazy = true},
})


--require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
