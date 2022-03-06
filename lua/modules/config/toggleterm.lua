require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height
    if term.direction == "horizontal" then
        return math.floor(height/3)
    elseif term.direction == "vertical" then
        return math.floor(width/2)
    end
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 0, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'rounded',
    width = function()
        local stats = vim.api.nvim_list_uis()[1]
        local width = stats.width
        return math.floor(width * 0.7)
    end,
    height = function()
        local stats = vim.api.nvim_list_uis()[1]
        local height = stats.height
        return math.floor(height * 0.7)
    end,
    winblend = 1,
    highlights = {
      border = "TSNumber",
      background = "Normal",
    }
  }
}
