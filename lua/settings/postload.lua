local startup_group  = vim.api.nvim_create_augroup("Pconfig", {})

vim.api.nvim_create_autocmd("VimEnter", {
  group = startup_group,
  once = true,
  callback = function()
    local pwd = vim.fn.expand('%:p:h')
    local config_path = pwd .. "/.nvimrc.lua"
    local is_existed_config = vim.fn.filereadable(config_path)
    if is_existed_config == 1 then
      vim.api.nvim_exec("luafile " .. config_path, true)
    end
  end
})
