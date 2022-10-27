-- Default options
require('nightfox').setup({
  options = {
    styles = { -- Style to be applied to different syntax groups
      comments = "italic", -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "bold",
      functions = "italic"
    }
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
