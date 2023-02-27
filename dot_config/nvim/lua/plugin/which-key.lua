-- re-used commands
local buffer_next = ':bnext<CR>'
local load_config = ':luafile %<CR>'

-- which key configuration
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
