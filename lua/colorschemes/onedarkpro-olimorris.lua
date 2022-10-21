require("onedarkpro").setup({
  styles = { -- Choose from "bold,italic,underline"
    types = "NONE", -- Style that is applied to types
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "bold", -- Style that is applied to constants
    functions = "italic", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "NONE", -- Style that is applied to variables
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "italic" -- Style that is applied to virtual text
  },
  options = {
    cursorline = true, -- Use cursorline highlighting?
    transparency = false -- Use a transparent background?
  }
})

vim.cmd("colorscheme onedarkpro")
