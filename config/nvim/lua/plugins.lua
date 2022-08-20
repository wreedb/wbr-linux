-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use { 'one-dark/onedark.nvim', as = 'onedark' }
  use { 'dracula/vim', as = 'dracula' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'sainnhe/everforest', as = 'everforest' }
  use { 'shaunsingh/nord.nvim', as = 'nord' }

  use { 'brenoprata10/nvim-highlight-colors' }
  -- eww syntax support
  use { 'elkowar/yuck.vim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'kyazdani42/nvim-web-devicons'

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'nvim-treesitter/nvim-treesitter' 
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end}

end)
