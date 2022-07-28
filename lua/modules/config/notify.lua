require("notify").setup ({
	background_colour = "#000000",
  on_open = function(win)
    local width = vim.api.nvim_win_get_width(win)
    local height = vim.api.nvim_win_get_height(win)

    local new_width = math.min(width, 60)
    local new_height = height + math.floor(width / new_width)

    vim.api.nvim_win_set_option(win, "wrap", true)
    vim.api.nvim_win_set_option(win, "linebreak", true)
    vim.api.nvim_win_set_width(win, new_width)
    vim.api.nvim_win_set_height(win, new_height)
  end
})
