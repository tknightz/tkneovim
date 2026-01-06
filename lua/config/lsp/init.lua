local preset = require("config.lsp.preset")

local registry = require("mason-registry")

-- UI configurations
local function setup_ui_configs()
  -- Configure LSP windows
  -- local win = require("lspconfig.ui.windows")
  -- local _default_opts = win.default_opts
  -- win.default_opts = function(options)
  --   local opts = _default_opts(options)
  --   opts.border = "rounded"
  --   return opts
  -- end

  -- Configure handlers with rounded borders
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  --   vim.lsp.handlers.signature_help,
  --   { border = "rounded", close_events = { "CursorMoved", "BufHidden", "InsertCharPre" } }
  -- )
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  --   silent = true,
  -- })

  vim.lsp.handlers["client/registerCapability"] = (function(overridden)
    return function(err, res, ctx)
      local result = overridden(err, res, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if not client then
        return
      end
      for bufnr, _ in pairs(client.attached_buffers) do
        -- Call your custom on_attach logic...
        preset.on_attach(client, bufnr)
      end
      return result
    end
  end)(vim.lsp.handlers["client/registerCapability"])
end

-- Diagnostic configurations
local function setup_diagnostics()
  local diagnostic_opts = {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    float = {
      header = false,
      border = "rounded",
    },
  }

  vim.diagnostic.config(diagnostic_opts)

  -- Configure diagnostic signs
  local signs = {
    Error = " ",
    Warn = "󰀦 ",
    Info = "󰋼 ",
    Hint = " ",
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
      text = icon,
      numhl = "LspDiagnosticsDefault" .. type,
      texthl = "LspDiagnosticsDefault" .. type,
    })
  end

  -- Additional diagnostic sign configuration
  vim.diagnostic.config({
    signs = {
      text = {
        [1] = signs.Error,
        ["WARN"] = signs.Warn,
        ["HINT"] = signs.Hint,
      },
    },
  })

  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)
end

-- VTS diagnostic filtering
local function setup_vtsls_diagnostic_filter()
  local ignored_codes = { [6133] = true }
  local handler = vim.lsp.handlers[vim.lsp.protocol.Methods.textDocument_publishDiagnostics]

  vim.lsp.handlers[vim.lsp.protocol.Methods.textDocument_publishDiagnostics] = function(...)
    local res = select(2, ...)
    if res then
      local filtered = vim
        .iter(res.diagnostics or {})
        :filter(function(d)
          return d.source ~= "ts" or ignored_codes[d.code] == nil
        end)
        :totable()
      res.diagnostics = filtered
    end
    return handler(...)
  end
end

local attach_lsp_to_existing_buffers = vim.schedule_wrap(function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local valid = vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_get_option(bufnr, "buflisted")
    if valid and vim.bo[bufnr].buftype == "" then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname ~= "" then -- Only reload actual files, not scratch buffers
        local augroup_lspconfig = vim.api.nvim_create_augroup("lspconfig", { clear = false })
        vim.api.nvim_exec_autocmds("FileType", { group = augroup_lspconfig, buffer = bufnr })
      end
    end
  end
end)

-- Server setup
local function setup_language_servers()
  registry.refresh(function()
    local installed_servers = require("mason-lspconfig").get_installed_servers()
    for _, server in pairs(installed_servers) do
      -- if server ~= "" then
      --   if server == "harper_ls" then
      --     -- override priority
      --     vim.lsp.config("harper_ls", {
      --       filetypes = { "markdown", "text" },
      --     })
      --   end

      vim.lsp.enable(server)
      -- end
    end

    -- custom server
    vim.lsp.enable('tsgo')
    attach_lsp_to_existing_buffers()
  end)
end

-- Initialize LSP configurations
local function init()
  setup_ui_configs()
  setup_diagnostics()
  setup_vtsls_diagnostic_filter()
  setup_language_servers()
end

init()
