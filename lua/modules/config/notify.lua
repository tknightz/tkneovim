local notify= require("notify")

notify.setup ({
	background_colour = "#000000",
  on_open = function(win)
    local width = vim.api.nvim_win_get_width(win)
    local height = vim.api.nvim_win_get_height(win)

    local new_width = math.min(width, 60)
    local new_height = height + math.ceil(width / new_width) - 1

    vim.api.nvim_win_set_option(win, "wrap", true)
    vim.api.nvim_win_set_option(win, "linebreak", true)
    vim.api.nvim_win_set_width(win, new_width)
    vim.api.nvim_win_set_height(win, new_height)
  end
})

-- override built-in functions
if not old_print then
  old_print = _G.print
end
vim.notify = function(msg, level, opts)
  old_print(tostring(level) .. ": " .. msg .. " : " .. vim.inspect(opts))
  notify(msg, level, opts)
end
print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  vim.notify(table.concat(print_safe_args, ' '), "info")
end
