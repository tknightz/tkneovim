local M = {}

M.config_colorscheme = function(colorname)
  require(colorname).setup({
    style = "dark",
    transparent = false,
    code_style = {
      keywords = "italic,bold",
      functions = "bold",
    },

    plugins = {
      bufferline = true,
    },
  })

  vim.cmd("colorscheme " .. colorname)
end

return M
