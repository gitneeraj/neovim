vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineContextChar guifg=#5c6370 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#5c6370 gui=underline]]
vim.cmd [[highlight IndentBlanklineChar guifg=#3e444c gui=nocombine]]

vim.api.nvim_command("let g:indentLine_bufNameExclude = ['STARTIFY']")
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true
}
