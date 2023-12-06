local preset = require("modules.config.lspconfig.preset")

local M = {}

-- config that apply to all servers
M.general_configs = {
  capabilities = preset.capabilities,
  on_attach = preset.on_attach,
  init_options = { hostInfo = "neovim" },
}

-- custom configs for specify server
M.custom_configs = {
  gopls = {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
  },

  tailwindcss = {
    filetypes = { "css", "html", "svelte", "typescriptreact" },
  },

  emmet_ls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  prismals = {
    filetypes = { "prisma" },
  },

  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "*/openapi.(yml|yaml)",
        },
        schemaDownload = { enable = true },
        completion = true,
        validate = true,
      },
    },
  },

  ltex = {
    filetypes = {
      "markdown",
      "md",
      "latex",
      "org",
      "gitcommit",
    },
    settings = {
      ltex = {
        enabled = {"latex", "markdown", "gitcommit", "md", "org"},
        setenceCacheSize=5000,
        flags = { debounce_text_changes = 1000 },
        completionEnabled = true
      }
    }
  },
}

-- helper function to check if server is lsp
-- only lsp server will be registered here
M.is_lsp_server = function(server)
  for _, name in ipairs(server.spec.categories) do
    if name == "LSP" then
      return true
    end
  end

  return false
end

return M
