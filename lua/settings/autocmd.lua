vim.api.nvim_command('augroup terminal_settings')
vim.api.nvim_command('autocmd WinEnter term://* startinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd TermClose term://* :call nvim_input("<CR>")')
vim.api.nvim_command('augroup END')


vim.api.nvim_command("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
