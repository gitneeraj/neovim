local fn = vim.fn
local installPath = DATA_PATH .. '/site/pack/packer/start/packer.nvim'

-- install packer if it's not installed already
local packerBootstrap = nil
if fn.empty(fn.glob(installPath)) > 0 then
  packerBootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', installPath
  })
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer').startup(function(use)
  -- Packer should manage itself
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  -- use 'ful1e5/onedark.nvim'
  use 'navarasu/onedark.nvim'
  -- use 'monsonjeremy/onedark.nvim'
  -- use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  -- use "ellisonleao/gruvbox.nvim"
  use "olimorris/onedarkpro.nvim"
  use 'rmehri01/onenord.nvim'
  use 'marko-cerovac/material.nvim'
  use 'projekt0n/github-nvim-theme'

  -- Lualine for status bar
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons' -- optional, for file icons
    }
  }

  -- LSP packages
  use {"williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig"}
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'hrsh7th/cmp-buffer' -- completion for buffer
  use 'hrsh7th/cmp-path' -- completion for path
  use 'hrsh7th/cmp-cmdline' -- completion for cmd line
  use "rafamadriz/friendly-snippets" -- completion snippets
  use {'onsails/lspkind.nvim'} -- LSP kind for icons in completion menu

  -- Treesitter for better syntax highlight and more
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-tree-docs', requires = {'nvim-treesitter/nvim-treesitter'}}

  -- LspSaga for better UI for hover and others
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({border_style = "rounded"})
    end
  })

  -- LspSignature for signature help while typing
  use {"ray-x/lsp_signature.nvim"}

  -- Buffer/Tabs with barbar
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

  -- auto-indent
  use {'tpope/vim-sleuth'}

  -- show indentation levels
  use "lukas-reineke/indent-blankline.nvim"

  -- Gitsigns
  use {'lewis6991/gitsigns.nvim'}

  -- Plugin to comment codes
  use {'numToStr/Comment.nvim', requires = 'JoosepAlviste/nvim-ts-context-commentstring'}

  -- Dashboard
  -- use {'glepnir/dashboard-nvim'}
  use {'mhinz/vim-startify'}

  -- WhichKey for commands help
  use {"folke/which-key.nvim"}

  -- telescope - searching / navigation
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}

  -- Autopairs for brackets
  use 'windwp/nvim-autopairs'

  -- Formatting and linting with null-ls
  use({"jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim"}})

  -- Git conflict marker
  use 'rhysd/conflict-marker.vim'

  -- rooter to follow you
  use {
    "ahmedkhalf/lsp-rooter.nvim",
    config = function()
      require("lsp-rooter").setup {}
    end
  }

  -- Pretty Fold
  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  }

  -- colorizer hex codes and others
  use {'norcalli/nvim-colorizer.lua'}

  -- multi select cursor
  use {'mg979/vim-visual-multi'}

  -- Add/change/delete surrounding delimiter pairs with ease.
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use("petertriho/nvim-scrollbar")

  -- this will automatically install listed dependencies
  -- only the first time NeoVim is opened, because that's when Packer gets installed
  if packerBootstrap then require('packer').sync() end
end)

-- plugin specific configs go here
require('plugins.lualine-config')
require('plugins.nvim-tree-config')
require('plugins.lsp-configs')
require('plugins.nvim-cmp-config')
require('plugins.treesitter-config')
require('plugins.barbar-config')
require('plugins.comment-config')
require('plugins.indentline-config')
require('plugins.whichkey-config')
require('plugins.telescope-config')
require('plugins.autopairs-config')
require('plugins.null-ls-config')
require('plugins.scrollbar-config')
-- require('plugins.dashboard-config')
require('plugins.gitsigns-config')
require('plugins.colorizer-config')
-- require('colorschemes.onedark-monsonjeremy')
require('colorschemes.onenord-rmehri01')
-- require('colorschemes.onedark-navarasu')
-- require('colorschemes.nightfox-edeneast')

return packer
