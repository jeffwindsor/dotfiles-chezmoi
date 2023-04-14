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
  { 'pocco81/auto-save.nvim' },

  -- swiss army knife of plugins
  { 'echasnovski/mini.nvim',
    version = '*',
    lazy = true },

  -- vertical line hints for indentation
  { 'lukas-reineke/indent-blankline.nvim' },

  -- fuzzy finder
  { 'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    version = '*',
    lazy = true },

  -- key bindings popup menu
  { 'folke/which-key.nvim',
    lazt = true },

  -- file manager
  { 'nvim-tree/nvim-tree.lua',
    dependencies =  { 'nvim-tree/nvim-web-devicons' },
    lazy = true },

  -- LSP Configuration & Plugins
  { 'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', { 'j-hui/fidget.nvim', opts = {} }, 'folke/neodev.nvim', },
    lazy = true },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    lazy = true },

  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    lazy = true },

  -- auto adjust the tab length based on current files usage
  { 'tpope/vim-sleuth',
    lazy = true },

  -- show git gutter
  { 'lewis6991/gitsigns.nvim',
    lazy = true },

  -- markdown via glow
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow'},

  -- lua line
  { 'nvim-lualine/lualine.nvim',
      dependencies = {'nvim-web-devicons'}},

  -- --------------------------------------------------------------------------
  -- color schemes
  -- --------------------------------------------------------------------------
  {'folke/tokyonight.nvim', lazy = true},
  {'joshdick/onedark.vim', lazy = true},
  {'marko-cerovac/material.nvim', lazy = true},
  {'rebelot/kanagawa.nvim', lazy = true},
  {'shaunsingh/nord.nvim', lazy = true},
})

require('plugins.auto-save')
require('plugins.gitsigns')
require('plugins.indent-blankline')
require('plugins.mini')
require('plugins.nvim-cmp')
require('plugins.nvim-lsp')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.which-key')
require('plugins.lualine')


--require("lspconfig").lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}

