
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
	{"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Colorschemes
  "lunarvim/colorschemes",

  -- CMP plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completion
  "hrsh7th/cmp-path", -- path completion
  "hrsh7th/cmp-cmdline", -- commandline completion
  "hrsh7th/cmp-nvim-lua", -- Add completion for vim stuff
  "saadparwaiz1/cmp_luasnip", -- snippet completions

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
})

