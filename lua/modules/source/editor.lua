return {
  -- Providing completion out of the box
  ["cmp"] = {
    path = "hrsh7th/nvim-cmp",
    module = "cmp",
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = "cmp" },
      { 'hrsh7th/cmp-buffer', after = "cmp" },
      { 'hrsh7th/cmp-path', after = "cmp" },
      { 'hrsh7th/cmp-emoji', after = "cmp" },
      { 'saadparwaiz1/cmp_luasnip', after = "cmp" },
    },
    event = "InsertEnter",
  },

  ["luasnip"] = {
    path = "L3MON4D3/LuaSnip",
    opt = true
  },
  
  ["friendlysnippet"] = {
    path = "rafamadriz/friendly-snippets"
  },

  -- Smart and powerful comment plugin for neovim
  ["comment"] = {
    path = "numToStr/Comment.nvim",
    event = "BufRead",
  },

  -- Align code
  ["ezalign"] = {
    path = "junegunn/vim-easy-align",
    cmd = "EasyAlign"
  },

  -- Better playing with brackets
  ["sandwich"] = {
    path = "machakann/vim-sandwich",
    event = "BufRead"
  },

  -- Auto close brackets
  ["autopairs"] = {
    path = "windwp/nvim-autopairs",
    event = "InsertEnter"
  },

  -- Change html tags quickly
  ["tagalong"] = {
    path = "AndrewRadev/tagalong.vim",
    ft = {"html", "xml", "javascriptreact", "javascript"},
  },
  
  -- Indent guides for Neovim
  ["indentguide"] = {
    path = "lukas-reineke/indent-blankline.nvim",
    event = "BufRead"
  },
}
