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

  -- --------------------------------------------------------------------------
  -- auto save on focus change
  -- --------------------------------------------------------------------------
  { 'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup({
        enabled = true,
        -- callbacks = {
        --   before_saving = function(buf)
        --     MiniTrailspace.trim()
        --   end,
        -- }
      })
    end,
  },

  -- --------------------------------------------------------------------------
  -- swiss army knife of plugins
  -- --------------------------------------------------------------------------
  { 'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.ai').setup()
      require('mini.align').setup()
      -- require('mini.base16').setup()	      -- supply palette instead of color schemes?
      -- require('mini.basics').setup()     	-- leran from these settings or just use?
      require('mini.comment').setup()
      require('mini.completion').setup()
      require('mini.cursorword').setup()      -- highlight word under cursor matches
      --require('mini.indentscope').setup()
      require('mini.jump2d').setup()          -- leap like jumps / finds
      require('mini.move').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()        -- surrond object with ({', etc
      require('mini.tabline').setup()
      require('mini.trailspace').setup()      -- highlights trailing whitespace
    end,
  },

  -- --------------------------------------------------------------------------
  -- vertical line hints for indentation
  -- --------------------------------------------------------------------------
  { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        char = '┊',
        show_trailing_blankline_indent = false })
    end,
  },

  -- --------------------------------------------------------------------------
  -- fuzzy finder
  -- --------------------------------------------------------------------------
  { 'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending' }})
    end,
  },

  -- --------------------------------------------------------------------------
  -- pop up displaying possible key bindings
  -- --------------------------------------------------------------------------
  { 'folke/which-key.nvim',
    config = function()
      require('plugins.which-key')
    end,
  },

  -- --------------------------------------------------------------------------
  -- file manager
  -- --------------------------------------------------------------------------
  { 'nvim-tree/nvim-tree.lua',
    dependencies =  { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        renderer = { group_empty = true },
        filters = { dotfiles = true },
      })
    end,
  },

  -- --------------------------------------------------------------------------
  -- development goodies
  -- --------------------------------------------------------------------------
  { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end },
  { 'neovim/nvim-lspconfig' },

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
