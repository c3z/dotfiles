local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'
  use "daschw/leaf.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "xiyaowong/transparent.nvim"

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'ThePrimeagen/vim-be-good'
  use 'ThePrimeagen/harpoon'

  use 'christoomey/vim-tmux-navigator'
  use "daschw/leaf.nvim"
  use 'vim-test/vim-test'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'terrortylor/nvim-comment'
  use 'jose-elias-alvarez/null-ls.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'github/copilot.vim'
  end
  )
