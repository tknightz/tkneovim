local lint = require("lint")

vim.g.lint_loaded = true

lint.linters_by_ft = {
  -- javascript = { "biomejs" },
  -- typescript = { "biomejs" },
  -- typescriptreact = { "eslint" },
}

-- run try_lint when it's loaded
lint.try_lint()

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end
})
