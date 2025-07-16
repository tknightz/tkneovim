local build_keymaps = require("lib").build_keymaps

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

-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   group = vim.api.nvim_create_augroup("MyFilePost", { clear = true }),
--   callback = function(args)
--     -- turn on message window in nightly
--     if vim.fn.has("nvim-0.12") then
--       require("vim._extui").enable({})
--     end
--   end,
--   once = true,
-- })

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

-- ╭─────────────────────────────────────────────────────────╮
-- │            Display LSP progress like fidget             │
-- ╰─────────────────────────────────────────────────────────╯
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("auto-last-position", { clear = true }),
  callback = function(args)
    local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
    local winid = vim.fn.bufwinid(args.buf)
    pcall(vim.api.nvim_win_set_cursor, winid, position)
  end,
  desc = "Auto jump to last position",
})

local restore_cursor_augroup = vim.api.nvim_create_augroup("restore_cursor_shape_on_exit", { clear = true })
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  group = restore_cursor_augroup,
  desc = "restore the cursor shape on exit of neovim",
  command = "set guicursor=a:hor25-blinkwait300-blinkon200-blinkoff150",
})



vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf_keys = client.config.keys and client.config.keys or {}
    build_keymaps(args.bufnr, buf_keys)
  end,
})
