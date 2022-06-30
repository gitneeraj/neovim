local opts = {noremap = true, silent = true}
vim.keymap.set('', 'J', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('', 'K', '<Cmd>BufferNext<CR>', opts)
vim.keymap.set('', 'X', '<Cmd>BufferClose<CR>', opts)
