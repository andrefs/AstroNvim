local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local set = vim.opt


local config = {

  -- Set colorscheme
  colorscheme = "nordfox",

  -- Add plugins
  plugins = {
    {
      "EdenEast/nightfox.nvim",
      event = "BufRead",
      config = function()
        local nightfox = require('nightfox')
        nightfox.setup({
          fox = "nordfox",
        })
        nightfox.load('nordfox')
      end,
    },
    { "tjvr/vim-nearley" },
    -- { "andweeb/presence.nvim" },
    -- {
    -- "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    -- config = function()
    -- require("lsp_signature").setup()
    -- end,
    -- },
  },

  overrides = {
    treesitter = {
      ensure_installed = { "lua" },
    },
  },

  -- On/off virtual diagnostics text
  virtual_text = true,

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    lspsaga = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = false,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },
}

-- Set options
set.relativenumber = false                     -- Don't use relative line numbers
set.wrap = true                                -- Wrap lines longer than the width of window

-- Set key bindings
map("n", "<C-s>", ":w!<CR>", opts)

-- Remap , as leader key
map("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Set autocommands
vim.cmd [[
  augroup packer_conf
    autocmd!
    autocmd bufwritepost plugins.lua source <afile> | PackerSync
  augroup end
]]

return config
