-- auto enter insert mode when jump to terminal buffer
local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  group = terminal_group,
  callback = function()
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

-- disable break comment line
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})


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


-- listent to event CursorMoved to echohl the message of lsp diagnostic
local cfg = {
  [1] = {
    icon = " ",
    hl = "DiagnosticError"
  },
  [2] = {
    icon = "󰀦 ",
    hl = "DiagnosticWarn"
  },
  [3] = {
    icon = "󰋼 ",
    hl = "DiagnosticInfo"
  },
  [4] = {
    icon = " ",
    hl = "DiagnosticHint"
  },
}
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = function()
--     if vim.g.loaded_lsp == 0 then
--       return
--     end
--
--     local current_line = vim.api.nvim_win_get_cursor(0)[1]
--     local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })
--
--     if diagnostics and diagnostics[1] then
--       local message = diagnostics[1].message
--       message = string.sub(message, 1, 160)
--       local config = cfg[diagnostics[1].severity]
--       vim.api.nvim_echo({ { string.format("(%s) %s", config.icon, message), config.hl } }, false, {})
--     else
--       vim.api.nvim_echo({ { "" } }, false, {})
--     end
--   end,
-- })
