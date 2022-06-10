function setup()
  render = {
    hightlight_git = 1,
    root_folder_modifier = ":t",
    highlight_opened_files = 1,
    icons = {
      padding = "    ",
      show = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
      },

      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★"
        },
        folder = {
          default = "",
          arrow_open = "",
          arrow_closed = "",
          open = " ",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = ""
        },
        lsp = {
          hint = '',
          info = "",
          warning = "",
          error = ""
        }
      }
    }
  }
end

setup()
