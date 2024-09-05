if vim.g.neovide then
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end

  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "BlexMono Nerd Font,Symbols Nerd Font Mono:h11" -- text below applies for VimScript
  -- vim.o.linespace = 8

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 1
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.opt.cmdheight = 0
end
