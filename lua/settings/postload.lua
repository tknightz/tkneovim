-- sidebar highlight autocmd
local is_sidebar_ft = require("lib.consts").is_sidebar_ft
local is_special_ft = require("lib.consts").is_special_ft

local augroup = vim.api.nvim_create_augroup("AutoBGSidebar", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  callback = function(opts)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = opts.buf })
    -- turn off miniindentscope in special files
    if is_special_ft(ft) then
      vim.api.nvim_buf_set_var(opts.buf, "miniindentscope_disable", true)
    end

    if not is_sidebar_ft(ft) then
      return
    end

    vim.api.nvim_buf_set_var(opts.buf, "miniindentscope_disable", true)
    vim.api.nvim_command("setlocal nolist")
    vim.api.nvim_command("setlocal foldcolumn=0")
    vim.api.nvim_command("setlocal signcolumn=no")
    vim.api.nvim_command("setlocal nonumber norelativenumber")
    vim.api.nvim_command(
      "setlocal winhighlight=Normal:EdgyNormal,NormalNC:EdgyNormal,SignColumn:EdgyNormal,WinBar:EdgyWinbar,EndOfBuffer:EdgyNormal"
    )
  end,
  desc = "Bg color for sidebar",
})

-- disable edgy when open neovim to do git commit
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "COMMIT_EDITMSG",
  callback = function(opts)
    local current_windows = vim.api.nvim_list_wins()
    if #current_windows == 1 then
      vim.b[opts.buf].edgy_disable = true
    end
  end,
})

-- if vim.env.TMUX then
--   local function set_tmux_title()
--     local filepath = vim.fn.expand("%:~")
--     if filepath ~= "" then
--       vim.system({ "tmux", "set-option", "-g", "set-titles-string", filepath })
--     end
--   end
--
--   local function reset_tmux_title()
--     vim.system({ "tmux", "set-option", "-g", "set-titles-string", "#{pane_current_command}" })
--   end
--
--   vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
--     callback = set_tmux_title
--   })
--
--   vim.api.nvim_create_autocmd("VimLeave", {
--     callback = reset_tmux_title
--   })
-- end
--

-- local projectfile = vim.fn.getcwd() .. '/project.godot'
-- if vim.fn.filereadable(projectfile) == 1 then
--   vim.fn.serverstart '127.0.0.1:6004'
-- end
