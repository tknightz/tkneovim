local headband = require("nvim-headband")
local strict_combine = require("nvim-headband.filters").strict_combine
local ft_filter = require("nvim-headband.filters").ft_filter

local config = {
  window_filter = strict_combine(
    ft_filter {
      "gitcommit",
      "neo-tree",
      "toggleterm"
    }
  )
}

headband.setup(config)
