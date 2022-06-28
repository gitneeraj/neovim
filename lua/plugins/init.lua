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
    use 'navarasu/onedark.nvim'

    -- Lualine for status bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- File Explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
    }

    -- LSP packages
    use { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig"}
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'hrsh7th/cmp-buffer' -- completion for buffer
    use 'hrsh7th/cmp-path' -- completion for path
    use 'hrsh7th/cmp-cmdline' -- completion for cmd line
    use "rafamadriz/friendly-snippets" -- completion snippets
    use { 'onsails/lspkind.nvim' } -- LSP kind for icons in completion menu

    -- Treesitter for better syntax highlight and more
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

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

return packer

