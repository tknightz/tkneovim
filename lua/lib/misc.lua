local M = {}

local todo_float = { win = nil, buf = nil }

M.open_todo_float = function()
  if todo_float.win and vim.api.nvim_win_is_valid(todo_float.win) then
    vim.api.nvim_set_current_win(todo_float.win)
    return
  end

  local todo_path = vim.env.HOME .. "/todos/todo.md"
  local bufnr = vim.fn.bufadd(todo_path)
  vim.fn.bufload(bufnr)
  todo_float.buf = bufnr
  vim.b[bufnr].snacks_indent = false

  local ui = vim.api.nvim_list_uis()[1]
  if not ui then
    return
  end

  local max_width = math.max(20, ui.width - 4)
  local max_height = math.max(8, ui.height - 4)
  local width = math.min(70, math.floor(ui.width * 0.35))
  local height = math.min(20, math.floor(ui.height * 0.3))
  width = math.max(20, math.min(width, max_width))
  height = math.max(10, math.min(height, max_height))

  local row = math.max(0, ui.height - height - 4)
  local col = math.max(0, ui.width - width - 2)

  local win_id = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " TODOs ",
    title_pos = "left",
  })

  todo_float.win = win_id
  vim.api.nvim_set_option_value("winblend", 0, { win = win_id })
  vim.api.nvim_set_option_value("wrap", false, { win = win_id })
  vim.api.nvim_set_option_value("number", false, { win = win_id })
  vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })
  vim.api.nvim_set_option_value("signcolumn", "no", { win = win_id })
  vim.api.nvim_set_option_value(
    "winhighlight",
    "Normal:NormalFloat,FloatBorder:WhichKeyBorder,FloatTitle:WhichKeyBorder",
    { win = win_id }
  )

  local function update_todo_title()
    if not vim.api.nvim_win_is_valid(win_id) or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    local title = " TODOs "
    if vim.bo[bufnr].modified then
      title = " TODOs [+]"
    end

    local config = vim.api.nvim_win_get_config(win_id)
    config.title = title
    config.title_pos = "left"
    vim.api.nvim_win_set_config(win_id, config)
  end

  update_todo_title()

  local title_group = vim.api.nvim_create_augroup("todo_float_title", { clear = false })
  vim.api.nvim_create_autocmd({ "BufModifiedSet", "TextChanged", "TextChangedI", "BufWritePost" }, {
    group = title_group,
    buffer = bufnr,
    callback = update_todo_title,
    desc = "Update todo floating title on change",
  })

  vim.schedule(function()
    if not vim.api.nvim_win_is_valid(win_id) or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    local last_line = math.max(1, vim.api.nvim_buf_line_count(bufnr))
    vim.api.nvim_win_call(win_id, function()
      pcall(vim.api.nvim_win_set_cursor, win_id, { last_line, 0 })
    end)
  end)

  local group = vim.api.nvim_create_augroup("todo_float_autoclose", { clear = false })
  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "BufHidden" }, {
    group = group,
    buffer = bufnr,
    once = true,
    callback = function()
      update_todo_title()
      if vim.api.nvim_buf_is_valid(bufnr) then
        local name = vim.api.nvim_buf_get_name(bufnr)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
        if name ~= "" and buftype == "" and vim.bo[bufnr].modified then
          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("silent! write")
          end)
        end
      end
      if todo_float.win and vim.api.nvim_win_is_valid(todo_float.win) then
        local config = vim.api.nvim_win_get_config(todo_float.win)
        if config.relative ~= "" then
          vim.api.nvim_win_close(todo_float.win, true)
        end
      end
      todo_float.win = nil
      todo_float.buf = nil
    end,
    desc = "Auto-close todo floating window",
  })
end



return M
