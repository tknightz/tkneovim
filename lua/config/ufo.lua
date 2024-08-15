function fold_virt_text_handler(virtText, lnum, endLnum, width, truncate, ctx)
  -- include the bottom line in folded text for additional context
  local filling = ("   %d lines "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  table.insert(virtText, { filling, "Comment" })
  local endVirtText = ctx.get_fold_virt_text(endLnum)
  for i, chunk in ipairs(endVirtText) do
    local chunkText = chunk[1]
    local hlGroup = chunk[2]
    if i == 1 then
      chunkText = chunkText:gsub("^%s+", "")
    end
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(virtText, { chunkText, hlGroup })
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      table.insert(virtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  return virtText
end

local provider_by_ft = {
  typescriptreact = { 'lsp', 'indent' },
}

local ufo = require("ufo")
-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
ufo.setup({
  enable_get_fold_virt_text = true,
  fold_virt_text_handler = fold_virt_text_handler,
  provider_selector = function(bufnr, ft)
    return provider_by_ft[ft] ~= nil and provider_by_ft[ft] or { "treesitter" }
  end,
})

vim.keymap.set("n", "zM", ufo.closeAllFolds, { silent = true })
vim.keymap.set("n", "zR", ufo.openAllFolds, { silent = true })
