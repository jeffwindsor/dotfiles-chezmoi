local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local telescope = require('telescope')

telescope.setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
  },
}

