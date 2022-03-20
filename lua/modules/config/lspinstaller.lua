local lsp_installer = require("nvim-lsp-installer")
local preset = require("modules.config.lspconfig.preset")

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = preset.capabilities,
    on_attach = preset.on_attach
  }

  if server.name == "ltex" then
    opts.enabled = {"latex", "txt", "markdown"}
    opts.language = "en"
  end

  if server.name == "emmet_ls" then
    opts.filetypes = {"css", "html", "typescriptreact"}
  end

  server:setup(opts)
end)
