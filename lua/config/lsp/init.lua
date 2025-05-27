local lspconfig = require("lspconfig")
local registry = require("mason-registry")

-- UI configurations
local function setup_ui_configs()
  -- Configure LSP windows
  local win = require("lspconfig.ui.windows")
  local _default_opts = win.default_opts
  win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "rounded"
    return opts
  end

  -- Configure handlers with rounded borders
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded", close_events = { "CursorMoved", "BufHidden", "InsertCharPre" } }
  )
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    silent = true,
  })
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

-- Server setup
local function setup_language_servers()
  registry.refresh(function()
    local installed_servers = require("mason-lspconfig").get_installed_servers()
    local build_server_config = require("config.lsp.mason.server_configs").build_server_config

    for _, server in pairs(installed_servers) do
      local config = build_server_config(server)
      lspconfig[server].setup(config)
    end
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
