vim.api.nvim_command('augroup startup')
vim.api.nvim_command('autocmd BufReadPost * :lua require("settings.mappings")')
vim.api.nvim_command('autocmd BufReadPost * :lua require("settings.postload")')
vim.api.nvim_command('augroup END')



vim.api.nvim_command('augroup terminal_settings')
-- vim.api.nvim_command('autocmd WinEnter term://* startinsert')
vim.api.nvim_command('autocmd TermEnter * startinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd TermClose * :call feedkeys("i")')
vim.api.nvim_command('augroup END')


-- Auto jump to the last edit
vim.api.nvim_command('augroup editor')
vim.api.nvim_command('autocmd BufReadPost * normal! g`"zv')
vim.api.nvim_command('augroup END')
