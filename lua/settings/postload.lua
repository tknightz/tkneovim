-- sidebar highlight autocmd
local sidebar_filetypes = require("lib.consts").sidebar_fts

local augroup = vim.api.nvim_create_augroup("AutoBGSidebar", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(opts)
    local ft = vim.api.nvim_buf_get_option(opts.buf, "filetype")
    if not vim.tbl_contains(sidebar_filetypes, ft) then
      return
    end

    vim.api.nvim_buf_set_var(opts.buf, "miniindentscope_disable", true)
    vim.api.nvim_command("setlocal signcolumn=no")
    vim.api.nvim_command("setlocal nonumber norelativenumber")
    vim.api.nvim_command(
      "setlocal winhighlight=Normal:EdgyNormal,NormalNC:EdgyNormal,SignColumn:EdgyNormal,WinBar:EdgyWinbar,EndOfBuffer:EdgyNormal"
    )
  end,
  desc = "Bg color for sidebar",
})
