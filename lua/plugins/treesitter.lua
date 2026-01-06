return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "VeryLazy" },
    branch = "main",
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
      -- copy from lazynvim
      require("lazy.core.loader").add_to_rtp(plugin)
      -- require("nvim-treesitter.query_predicates")
      local ensure_installed = {
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "bash",
        "diff",
        "dockerfile",
        "gitignore",
        "git_config",
        "luadoc",
        "regex",
        "toml",
        "yaml",
        "csv",
        "java",
        "python",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "sql"
      }

      vim.treesitter.language.register("bash", { "sh" })
      vim.treesitter.language.register("markdown", { "mdx", "Avante" })
      vim.treesitter.language.register("json", "kulala-json")
      vim.treesitter.language.register("http", { "kulala_http", "http" })
      vim.treesitter.language.register("tsx", { "typescriptreact" })

      local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
      end
      local to_install = vim.tbl_filter(isnt_installed, ensure_installed)
      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- Ensure tree-sitter enabled after opening a file for target language
      local filetypes = {}
      for _, lang in ipairs(ensure_installed) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
          table.insert(filetypes, ft)
        end
      end
      local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      -- WARN: Do not use "*" here - snacks.nvim is buggy and vim.notify triggers FileType events internally causing infinite callback loops
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Start treesitter",
        group = vim.api.nvim_create_augroup("start_treesitter", { clear = true }),
        pattern = filetypes,
        callback = ts_start,
      })
    end,
    build = ":TSUpdate",
    -- build = function()
    --   local ts_update = require("nvim-treesitter.install").update({ with_sync = false })
    --   ts_update()
    -- end,
    config = function()
      require("config.treesitter")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    branch = "main",
    event = "User FilePost",
    config = function()
      require("config.text-objects")
    end,
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "User FilePost",
    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "User FilePost" },
    config = function()
      require("treesitter-context").setup({
        max_lines = 3,
        multiline_threshold = 1,
        separator = "─",
        min_window_height = 20,
      })
    end,
  },
}
