-- ----------------------------------------------------------------------------
--bootstrap plugin manager if not installed
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------
-- load plugins
-- ----------------------------------------------------------------------------
require("lazy").setup({
  -- personal workflow plugins
  { 'pocco81/auto-save.nvim' },
  -- swiss army knife plugin
  { 'echasnovski/mini.nvim',
    version = '*',
    lazy = true
  },
  -- fuzzy finder
  { 'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'}
  },
  -- shortcut key help
  { 'folke/which-key.nvim', 
    lazy = true 
  },
  -- file explorer
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },

  -- vertical indent lines
  { 'lukas-reineke/indent-blankline.nvim' },
  -- auto completiong
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  -- language servers
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }},
  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter' },

  -- color schemes
  { 'folke/tokyonight.nvim', lazy = true},
  { 'joshdick/onedark.vim', lazy = true},
  { 'marko-cerovac/material.nvim', lazy = true},
  { 'mhartington/oceanic-next', lazy = true},
  { 'rebelot/kanagawa.nvim', lazy = true},
  { 'shaunsingh/nord.nvim', lazy = true},
})

-- ----------------------------------------------------------------------------
-- setup plugins
-- ----------------------------------------------------------------------------
require('plugins.which-key')
require('mini.ai').setup()
require('mini.align').setup()
-- require('mini.base16').setup()	      -- supply palette instead of color schemes?
-- require('mini.basics').setup()     	-- leran from these settings or just use?
require('mini.comment').setup()
--require('mini.completion').setup()
require('mini.cursorword').setup()      -- highlight word under cursor matches
--require('mini.indentscope').setup()
require('mini.jump2d').setup()          -- leap like jumps / finds
require('mini.move').setup()
require('mini.statusline').setup()
require('mini.surround').setup()        -- surrond object with ({', etc
require('mini.tabline').setup()
require('mini.trailspace').setup()      -- highlights trailing whitespace

require("auto-save").setup({
  enabled = true
})

require("indent_blankline").setup({
  char = '┊',
  show_trailing_blankline_indent = false,
})

require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
  }
})
