-- sidebar highlight autocmd
local sidebar_filetypes = {
  "fugitive",
  "aerial",
  "toggleterm",
}

local augroup = vim.api.nvim_create_augroup("AutoBGSidebar", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(sidebar_filetypes, vim.bo.filetype) then
      vim.api.nvim_command("setlocal nonumber norelativenumber")
      vim.api.nvim_command("setlocal signcolumn=yes:1")
      vim.api.nvim_command("setlocal winhighlight=Normal:EdgyNormal,NormalNC:EdgyNormal,SignColumn:EdgyNormal,WinBar:EdgyWinbar,EndOfBuffer:EdgyNormal")
    end
  end,
  desc = "Bg color for sidebar",
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = augroup,
  callback = function(_)
    if not vim.tbl_contains(sidebar_filetypes, vim.bo.filetype) then
      return
    end

    -- set for all panel
    vim.api.nvim_command("setlocal nonumber norelativenumber")
    vim.api.nvim_command("setlocal winhighlight=Normal:EdgyNormal,NormalNC:EdgyNormal,SignColumn:EdgyNormal,WinBar:EdgyWinbar,EndOfBuffer:EdgyNormal")

    -- specify for terminals
    if vim.bo.filetype == "toggleterm" or vim.bo.filetype == "terminal" then
      vim.api.nvim_command("setlocal signcolumn=no")
      return
    end

    vim.api.nvim_command("setlocal signcolumn=yes:1")
  end,
  desc = "Bg color for sidebar",
})
