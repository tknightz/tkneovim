local icons = require("modules.config.lspconfig.icons").icons

local function get_color(hl_group)
  local colors = vim.api.nvim_get_hl_by_name(hl_group, true)
  colors.foreground = colors.foreground ~= nil and string.format("#%06x", colors.foreground) or nil
  colors.background = colors.background ~= nil and string.format("#%06x", colors.background) or nil
  return colors
end

local function setup_highlights()
  local winbar_colors = get_color("WinBar")
  vim.cmd("hi NavicText guibg="..winbar_colors.background)
  vim.cmd("hi NavicSeparator guibg="..winbar_colors.background)

  for name in pairs(icons) do
    local done, colors = pcall(get_color, "NavicIcons" .. name)
    if done then
      local cmd_hi = string.format("hi %s guifg=%s guibg=%s", "NavicIcons" .. name, colors.foreground, winbar_colors.background)
      vim.cmd(cmd_hi)
    end
  end
end

setup_highlights()
require("nvim-navic").setup {
  icons = icons,
  highlight = true,
  separator = " > ",
}
