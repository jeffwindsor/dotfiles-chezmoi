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
  { 'echasnovski/mini.nvim', version = '*', lazy = true },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'} },
  { 'folke/which-key.nvim', lazy = true },

  -- color schemes
  { 'folke/tokyonight.nvim', lazy = true},
  { 'joshdick/onedark.vim', lazy = true},
  { 'marko-cerovac/material.nvim', lazy = true},
  { 'mhartington/oceanic-next', lazy = true},
  { 'rebelot/kanagawa.nvim', lazy = true},
  { 'shaunsingh/nord.nvim', lazy = true},

  -- development
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  { 'neovim/nvim-lspconfig',              -- LSP Configuration & Plugins
    dependencies = {
      'williamboman/mason.nvim',              -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',                    -- Useful status updates for LSP
      'folke/neodev.nvim',                    -- Additional lua configuration, makes nvim stuff amazing
    }},
  { 'hrsh7th/nvim-cmp',                   -- Autocompletion
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }},
  { 'nvim-treesitter/nvim-treesitter' },    -- Highlight, edit, and navigate code
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
