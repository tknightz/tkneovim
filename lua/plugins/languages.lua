return {
  -- Like its name, open markdown preview on browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    opts = {
      file_types = { "markdown", "Avante", "codecompanion", "todo", "mdx", "copilot-chat" },
      -- anti_conceal = { enabled = false },
      code = {
        border = "thick",
        style = "full",
      },
      -- overrides = {
      --   buftype = {
      --     nofile = {
      --       code = { border = "thin", style = "normal" },
      --     }
      --   }
      -- }
    },
    ft = { "markdown", "Avante", "mdx", "copilot-chat" },
  },

  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "mdx" },
  },

  {
    "bngarren/checkmate.nvim",
    ft = { "markdown", "todo" },
    opts = {
      show_todo_count = true,
      todo_count_position = "eol",
      todo_count_recursive = true,
      use_metadata_keymaps = true,
      style = {
        CheckmateTodoCountIndicator = { fg = "#c75ae8", bold = true },
      },
      todo_count_formatter = function(completed, total)
        return string.format(" 󰣉 (%s/%s) %.0f%%", completed, total, completed / total * 100)
      end,
      todo_states = {
        -- Built-in states (cannot change markdown or type)
        unchecked = { marker = "☐" },
        checked = { marker = "✔" },

        -- Custom states
        in_progress = {
          marker = "󰿦",
          markdown = ".", -- Saved as `- [.]`
          type = "incomplete", -- Counts as "not done"
          order = 50,
        },
        cancelled = {
          marker = "",
          markdown = "c", -- Saved as `- [c]`
          type = "complete", -- Counts as "done"
          order = 2,
        },
        on_hold = {
          marker = "󱫞",
          markdown = "/", -- Saved as `- [/]`
          type = "inactive", -- Ignored in counts
          order = 100,
        },
      },
    },
  },
}
