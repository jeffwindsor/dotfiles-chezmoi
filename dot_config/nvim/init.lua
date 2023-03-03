-- ----------------------------------------------------------------------------
-- PLUGIN MANAGER
-- ----------------------------------------------------------------------------
-- bootstrap lazy nvim
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

-- load plugins
require("lazy").setup({
  'pocco81/auto-save.nvim',                  -- auto save on return to normal mode
  {'echasnovski/mini.nvim', version = '*', lazy = true},
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',           -- Fuzzy Finder (files, lsp, etc)
  {'folke/which-key.nvim', lazy = true},     -- display key bindings (like emacs)

  -- color schemes
  {'folke/tokyonight.nvim', lazy = true},
  {'joshdick/onedark.vim', lazy = true},
  {'marko-cerovac/material.nvim', lazy = true},
  {'mhartington/oceanic-next', lazy = true},
  {'rebelot/kanagawa.nvim', lazy = true},
  {'shaunsingh/nord.nvim', lazy = true},

})

-- ----------------------------------------------------------------------------
-- COLORSCHEME DEFAULT
-- ----------------------------------------------------------------------------
vim.cmd 'colorscheme tokyonight-storm'

-- ----------------------------------------------------------------------------
-- PLUGIN: AUTO-SAVE
-- ----------------------------------------------------------------------------
require("auto-save").setup({ enabled = true })

-- ----------------------------------------------------------------------------
-- PLUGIN: MINI
-- ----------------------------------------------------------------------------
require('mini.ai').setup()
require('mini.align').setup()
-- require('mini.base16').setup()	      -- supply palette instead of color schemes?
-- require('mini.basics').setup()     	-- leran from these settings or just use?
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.cursorword').setup()      -- highlight word under cursor matches
require('mini.indentscope').setup()
require('mini.jump2d').setup()          -- leap like jumps / finds
require('mini.move').setup()
require('mini.statusline').setup()
require('mini.surround').setup()        -- surrond object with ({', etc
require('mini.tabline').setup()
require('mini.trailspace').setup()      -- highlights trailing whitespace

-- ----------------------------------------------------------------------------
-- PLUGIN: TELESCOPE
-- ----------------------------------------------------------------------------
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
  },
}
-- ----------------------------------------------------------------------------
-- PLUGIN: WHICH KEY
-- ----------------------------------------------------------------------------
local buffer_next = ':bnext<CR>'
local load_config = ':luafile %<CR>'
local wk = require('which-key')
wk.setup()
wk.register({
  ["<leader>"] = { ':Telescope spell_suggest<CR>', 'spelling'},
  ["."] = { load_config .. ':echo "Configuration Re-Loaded"<CR>', 'load config'},
  [","] = {
    name = 'commands',
    [","] = { ':Telescope commands<CR>','search commands'},
    a = { ':Telescope autocommands<CR>', 'search auto commands' },
    h = { ':Telescope command_history<CR>','search command history'},
    p = { ':Telescope builtin<CR>','pickers'},
  },
  b = {
    name = 'buffers',
    b = { ':Telescope buffers<CR>','buffers'},
    c = { ':bdelete<CR>','close'},
    j = { ':bprev<CR>','previous'},
    k = { buffer_next,'next'},
    n = { ':enew<CR>','new'},
    s = { ':Telescope current_buffer_fuzzy_find<CR>', 'search text'},
    t = { ':Telescope current_buffer_tags<CR>', 'search tags' },
  },
  c = {
    name = 'color schemes',
    c = { ':Telescope colorscheme<CR>','color schemes'},
    d = { ':set background=dark<CR>','dark'},
    l = { ':set background=light<CR>','light'},
    m = { ':lua require("material.functions").find_style()<CR>', 'material' },
    o = { ':colorscheme OceanNext<CR>', 'ocean next' },
    k = { ':colorscheme kanagawa<CR>', 'kanagawa' },
    n = { ':colorscheme nord<CR>', 'nord' },
    t = {
      name = 'tokyo night',
      n = { ':colorscheme tokyonight-night<CR>', 'night' },
      s = { ':colorscheme tokyonight-storm<CR>', 'storm' },
      d = { ':colorscheme tokyonight-day<CR>', 'day' },
      m = { ':colorscheme tokyonight-moon<CR>', 'moon' },
    },
    ["1"] = { ':colorscheme onedark<CR>', 'one dark' },
  },
  f = {
    name = 'files',
    b = { ':Telescope file_browser<CR>','via browser'},
    c = { ':Telescope find_files cwd=$XDG_CONFIG_HOME<CR>','in config directory'},
    d = { ':Telescope find_files cwd=$DOTFILES<CR>','in dotfiles directory'},
    f = { ':Telescope find_files<CR>','in current directory'},
    g = { ':Telescope find_files cwd=$SRC<CR>','in git repos'},
    h = { ':Telescope find_files cwd=$HOME<CR>','in home directory'},
    i = { ':Telescope find_files cwd=$INSTALLS<CR>','in install files directory'},
    p = { ':Telescope project_files<CR>','in project'},
    s = { ':Telescope live_grep<CR>','grep'},
    t = { ':Telescope filetypes<CR>','set file type'},
  },
  g = {
    name = 'git',
    b = { ':Telescope git_branches<CR>','branches'},
    c = { ':Telescope git_commits<CR>','commits'},
    f = { ':Telescope git_files<CR>','files'},
    s = { ':Telescope git_status<CR>','status'},
  },
  h = {
    name = 'help',
    h = { ':Telescope help_tags<CR>','topics'},
    m = { ':Telescope help_tags<CR>','man-pages'},
  },
  j = { ':Telescope jumplist<CR>', 'jump lists'},
  k = { ':Telescope keymaps<CR>', 'key maps'},
  l = {
    name = 'lsp',
    d = { ':Telescope lsp_definitions<CR>','definition'},
    i = { ':Telescope lsp_implementations<CR>','implementations'},
    r = { ':Telescope lsp_references<CR>','references'},
    t = { ':Telescope lsp_type_definitions<CR>','type'},
  },
  m = {
    name = 'mini nvim',
    a = {
      name = 'align <TBD>',
    },
    c = {
      name = 'comment',
      l = {'gcc','toggle line (gcc)'},
    },
    t = {
      name = 'trim whitespace',
      l = { ':lua MiniTrailspace.trim_last_lines()', 'trailing' },
      w = { ':lua MiniTrailspace.trim()', 'last lines' },
    },
  },
  p = { ':Lazy<CR>', 'package manager'},
  q = { ':q<CR>','quit'},
  r = { ':Telescope registers<CR>','registers'},
  t = {
    name = 'tabs',
    c = { ':tabclose<CR>','close'},
    j = { ':tabprevious<CR>','previous'},
    k = { ':tabnext<CR>','next'},
    n = { ':tabnew<CR>','new'},
  },
  w = {
    name = 'windows',
    c = { ':close<CR>','close'},
    h = {'<C-W><left>','left'},
    j = {'<C-W><down>','down'},
    k = {'<C-W><up>','up'},
    l = {'<C-W><right>','right'},
    s = { ':split<CR>' .. buffer_next,'split down'},
    v = { ':vsplit<CR>' .. buffer_next,'split right'},
    x = {
      name = 'resize',
      h = { ':vertical resize -5<CR>','left'},
      j = { ':resize -5<CR>','down'},
      k = { ':resize +5<CR>','up'},
      l = { ':vertical resize +5<CR>','right'},
    },
  },
  x = { ':q!<CR>', 'force quit'},
},
{ prefix = '<leader>'}
);

-- ----------------------------------------------------------------------------
-- OPTIONS: more info @ `:h vim.o`
-- ----------------------------------------------------------------------------
vim.g.mapleader       = " "            -- map leader to <space>
vim.g.maplocalleader  = " "            -- map local leader to <space>
vim.o.autoindent      = true
vim.o.background      = 'dark'
vim.o.backspace       = 'indent,eol,start'
vim.o.breakindent     = true          -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
vim.o.clipboard       = 'unnamedplus'
vim.o.completeopt     = 'menuone,noselect'  -- completion: menuone=Use the popup menu also when there is only one match. noselect=force the user to select
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
vim.o.relativenumber  = false          -- hybrid number scheme
vim.o.ruler           = true
vim.o.shiftwidth      = 2
vim.o.smartcase       = true          -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartindent     = true
vim.o.smarttab        = true
vim.o.softtabstop     = 2
vim.o.spell           = false
vim.o.spelllang       = 'en_us'
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.o.tabstop         = 2
vim.o.termguicolors   = true
vim.o.undofile        = true          -- Save undo history
vim.o.wrap            = false
vim.wo.signcolumn     = 'yes'         -- always

-- ----------------------------------------------------------------------------
-- AUTOCOMMANDS: more info @ `:h autocommands`
-- ----------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })


-- ----------------------------------------------------------------------------
-- KEY MAPPINGS:
--    <leader> key maps moved to WHICH KEY plugin config
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
vim.api.nvim_set_keymap("n", "gh", "^", silent)

--  last character in line
vim.api.nvim_set_keymap("n", "gl", "$", silent)

--  return removes search highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- PERSONAL muscle memory improvements
--  command mode without the shift key (normal and visual mode)
vim.api.nvim_set_keymap('n', ';', ':', noremap)
vim.api.nvim_set_keymap('v', ';', ':', noremap)

--  yank acts like other capitol letters (normal mode)
vim.api.nvim_set_keymap('n', 'Y', 'y$', noremap)

