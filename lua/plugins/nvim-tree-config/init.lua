local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.api')
local opts = {silent = true, noremap = true}

local function get_tree_size()
  return vim.api.nvim_win_get_width(0)
end

nvim_tree_events.on_tree_open(function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.on_tree_resize(function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.on_tree_close(function()
  bufferline_state.set_offset(0)
end)

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)

require("nvim-tree").setup()
