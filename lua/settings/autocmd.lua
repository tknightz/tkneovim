local debounce = require("lib").debounce
local truncate_message = require("lib").truncate_message

-- ╭─────────────────────────────────────────────────────────╮
-- │   auto enter insert mode when jump to terminal buffer   │
-- ╰─────────────────────────────────────────────────────────╯
local terminal_group = vim.api.nvim_create_augroup("Terminal", {})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = terminal_group,
  callback = function()
    if vim.bo.filetype ~= "toggleterm" then
      return
    end

    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" or mode == "nt" then
      -- start insert when enter terminal buf
      vim.schedule(function()
        vim.api.nvim_feedkeys("i", "n", true)
      end)
    end
  end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │ user event that loads after UIEnter + only if file buf  │
-- │                        is there                         │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("MyFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("MyFilePost")

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})
      end)
    end
  end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │           Print cursorline diagnostic message           │
-- │  listent to event CursorMoved to echohl the message of  │
-- │                     lsp diagnostic                      │
-- ╰─────────────────────────────────────────────────────────╯
local cfg = {
  [1] = {
    icon = "",
    hl = "DiagnosticError",
  },
  [2] = {
    icon = "󰀦",
    hl = "DiagnosticWarn",
  },
  [3] = {
    icon = "󰋼",
    hl = "DiagnosticInfo",
  },
  [4] = {
    icon = "",
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
    vim.api.nvim_echo({ { string.format("%s    %s", config.icon, message), styled_hl_group } }, false, {})
  else
    vim.api.nvim_echo({ { "" } }, false, {})
  end
end

-- Create a debounced version of the diagnostic check function
local debounced_check_diagnostics = debounce(check_diagnostics, 300)

-- Set up the autocmd for CursorMoved only inside LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  once = true,
  nested = true,
  callback = function()
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = debounced_check_diagnostics,
    })
  end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │            Display LSP progress like fidget             │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
