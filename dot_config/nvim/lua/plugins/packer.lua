-- majorly influenced by https://github.com/nvim-lua/kickstart.nvim

-- Install packer if needed and mark for plugin install 
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Packer using a startup function to 
require('packer').startup(function(use)
  -- ----------------------------------------------------------------------------------------------
  -- package management
  -- ----------------------------------------------------------------------------------------------
  use 'wbthomason/packer.nvim'              -- package manager

  -- ----------------------------------------------------------------------------------------------
  -- personal workflow
  -- ----------------------------------------------------------------------------------------------
  use { 'nvim-telescope/telescope.nvim',    -- Fuzzy Finder (files, lsp, etc)
    branch = '0.1.x', 
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'pocco81/auto-save.nvim'              -- auto save on return to normal mode
  use 'folke/which-key.nvim'                -- display key bindings (like emacs)

  -- ----------------------------------------------------------------------------------------------
  -- color schemes
  -- ----------------------------------------------------------------------------------------------
  use 'folke/tokyonight.nvim'
  use 'joshdick/onedark.vim'
  use 'marko-cerovac/material.nvim'
  use 'mhartington/oceanic-next'
  use 'rebelot/kanagawa.nvim'
  use 'shaunsingh/nord.nvim'
  
  -- ----------------------------------------------------------------------------------------------
  -- dev workflow
  -- ----------------------------------------------------------------------------------------------
  use { 'neovim/nvim-lspconfig',              -- LSP Configuration & Plugins
    requires = {
      'williamboman/mason.nvim',              -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',                    -- Useful status updates for LSP
      'folke/neodev.nvim',                    -- Additional lua configuration, makes nvim stuff amazing
    }}
  use { 'hrsh7th/nvim-cmp',                   -- Autocompletion
    requires = { 
      'hrsh7th/cmp-nvim-lsp', 
      'L3MON4D3/LuaSnip', 
      'saadparwaiz1/cmp_luasnip' 
    }}
  use { 'nvim-treesitter/nvim-treesitter',    -- Highlight, edit, and navigate code
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end}

  use { 'nvim-treesitter/nvim-treesitter-textobjects',  -- Additional text objects via treesitter
    after = 'nvim-treesitter'}

  use 'tpope/vim-fugitive'                  -- git wrapper
  use 'tpope/vim-rhubarb'                   -- git hub wrapper
  use 'lewis6991/gitsigns.nvim'             -- git gutter markers
  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim'               -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automatically

  -- if first time install then sync the plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
