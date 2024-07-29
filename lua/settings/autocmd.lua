local special_fts = require("lib.consts").special_fts

local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  group = terminal_group,
  callback = function(args)
    if vim.bo.filetype ~= "toggleterm" then
      return
    end

    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" or mode == "nt" then
      -- start insert when enter terminal buf
      -- vim.api.nvim_input('i')
      vim.api.nvim_feedkeys("i", "n", true)
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- copy the location of current file
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("DBEE", function()
  require("dbee").toggle()
end, {})


-- user event that loads after UIEnter + only if file buf is there
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("MyFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "MyFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})
      end)
    end
  end,
})
