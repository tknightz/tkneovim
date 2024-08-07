require("edgy").setup({
  animate = {
    enabled = false,
  },
  bottom = {
    -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
    {
      ft = "toggleterm",
      -- exclude floating windows
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    { ft = "dbout", title = "Dadbod Result" },
    { ft = "dbee-result", title = "DBEE Result" },
    {
      ft = "fugitive",
    },
    { ft = "NeogitStatus", title = "Git files" },
    { ft = "NeogitPopup" },
    {
      ft = "lazyterm",
      title = "LazyTerm",
      filter = function(buf)
        return not vim.b[buf].lazyterm_cmd
      end,
    },
    "trouble",
    { ft = "qf", title = "QuickFix" },
    {
      ft = "help",
      title = "Docs",
    },
    {
      ft = "gitcommit",
      title = "Gitcommit",
      filter = function(_)
        local current_windows = vim.api.nvim_list_wins()
        return #current_windows > 2
      end,
    },
    { ft = "DiffviewFileHistory" },
  },
  left = {
    {
      ft = "neo-tree",
      title = "Neotree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
    },
    { ft = "dbui", title = "Dadbod UI" },
    { ft = "dbee-drawer" },
    { ft = "dbee-call-log" },
  },
  right = {
    {
      ft = "aerial",
      open = "AerialOpen",
    },
    {
      ft = "Outline",
      open = "Outline",
    },
    {
      title = "Git status",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "git_status"
      end,
      pinned = true,
      open = "Neotree position=right selector=false git_status",
    },
    {
      ft = "sagaoutline",
      open = "LspSaga outline",
    },
  },
  options = {
    left = { size = 35 },
    right = { size = 35 },
    bottom = { size = 0.3 },
  },

  keys = {
    -- close window
    ["q"] = function(win)
      win:close()
    end,
    -- hide window
    ["<c-q>"] = function(win)
      win:hide()
    end,
    -- close sidebar
    ["Q"] = function(win)
      win.view.edgebar:close()
    end,
    -- next open window
    ["]w"] = function(win)
      win:next({ visible = true, focus = true })
    end,
    -- previous open window
    ["[w"] = function(win)
      win:prev({ visible = true, focus = true })
    end,
    -- next loaded window
    ["]W"] = function(win)
      win:next({ pinned = false, focus = true })
    end,
    -- prev loaded window
    ["[W"] = function(win)
      win:prev({ pinned = false, focus = true })
    end,
    -- increase width
    ["<M-h>"] = function(win)
      win:resize("width", 2)
    end,
    -- decrease width
    ["<M-l>"] = function(win)
      win:resize("width", -2)
    end,
    -- increase height
    ["<M-k>"] = function(win)
      win:resize("height", 2)
    end,
    -- decrease height
    ["<M-j>"] = function(win)
      win:resize("height", -2)
    end,
    -- reset all custom sizing
    ["<c-w>="] = function(win)
      win.view.edgebar:equalize()
    end,
  },
  icons = {
    closed = "   ",
    open = "   ",
  },
})
