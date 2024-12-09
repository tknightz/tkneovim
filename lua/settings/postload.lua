local debounce = require("lib").debounce
local truncate_message = require("lib").truncate_message

-- sidebar highlight autocmd
local sidebar_filetypes = require("lib.consts").sidebar_fts
local special_fts = require("lib.consts").special_fts

local augroup = vim.api.nvim_create_augroup("AutoBGSidebar", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  callback = function(opts)
    local ft = vim.api.nvim_buf_get_option(opts.buf, "filetype")
    -- turn off miniindentscope in special files
    if vim.tbl_contains(special_fts, ft) then
      vim.api.nvim_buf_set_var(opts.buf, "miniindentscope_disable", true)
    end

    if not vim.tbl_contains(sidebar_filetypes, ft) then
      return
    end

    vim.api.nvim_buf_set_var(opts.buf, "miniindentscope_disable", true)
    vim.api.nvim_command("setlocal nolist")
    vim.api.nvim_command("setlocal foldcolumn=0")
    vim.api.nvim_command("setlocal signcolumn=no")
    vim.api.nvim_command("setlocal nonumber norelativenumber")
    vim.api.nvim_command(
      "setlocal winhighlight=Normal:EdgyNormal,NormalNC:EdgyNormal,SignColumn:EdgyNormal,WinBar:EdgyWinbar,EndOfBuffer:EdgyNormal"
    )
  end,
  desc = "Bg color for sidebar",
})

-- Print cursorline diagnostic message
-- listent to event CursorMoved to echohl the message of lsp diagnostic
local cfg = {
  [1] = {
    icon = "  ",
    hl = "DiagnosticError",
  },
  [2] = {
    icon = " 󰀦 ",
    hl = "DiagnosticWarn",
  },
  [3] = {
    icon = " 󰋼 ",
    hl = "DiagnosticInfo",
  },
  [4] = {
    icon = "  ",
    hl = "DiagnosticHint",
  },
}

-- Cache for dynamically created highlight groups
local hl_cache = {}

-- Function to create or reuse a styled highlight group
local function get_styled_hl_group(base_hl)
  if hl_cache[base_hl] then
    return hl_cache[base_hl]
  end

  -- Get the color details of the base highlight group
  local hl_def = vim.api.nvim_get_hl_by_name(base_hl, true)
  if not hl_def.foreground then
    return base_hl -- Fallback to the base highlight group
  end

  -- Create a new highlight group name
  local new_hl = base_hl .. "_Bold"
  vim.api.nvim_set_hl(0, new_hl, { fg = string.format("#%06x", hl_def.foreground), bold = true })

  -- Cache and return the new highlight group name
  hl_cache[base_hl] = new_hl
  return new_hl
end

-- Function to check diagnostics and print a message
local function check_diagnostics()
  -- Check if current buffer is attached to an LSP client
  local buf_clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if vim.tbl_isempty(buf_clients) then
    return
  end

  local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1 -- Get current line (0-indexed)
  local diagnostics = vim.diagnostic.get(0, { lnum = current_line })
  if diagnostics and diagnostics[1] then
    local message = truncate_message(diagnostics[1].message, 160)
    local config = cfg[diagnostics[1].severity]
    local styled_hl_group = get_styled_hl_group(config.hl)
    vim.api.nvim_echo({ { string.format("(%s) %s", config.icon, message), styled_hl_group } }, false, {})
  else
    vim.api.nvim_echo({ { "" } }, false, {})
  end
end

-- Create a debounced version of the diagnostic check function
local debounced_check_diagnostics = debounce(check_diagnostics, 300)

-- Set up the autocmd for CursorMoved only inside LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  once = true,
  callback = function()
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = debounced_check_diagnostics,
    })
  end,
})
