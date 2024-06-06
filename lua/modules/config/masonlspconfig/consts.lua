local preset = require("modules.config.lspconfig.preset")
local util = require("lspconfig.util")

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
    filetypes = { "css", "html", "svelte", "javascriptreact", "typescriptreact", "astro" },
    root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
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
      "latex",
      "org",
    },
    settings = {
      ltex = {
        enabled = {"latex", "markdown", "org"},
        setenceCacheSize = 5000,
        additionalRules = { enablePickyRules = true },
        -- flags = { debounce_text_changes = 1000 },
        checkFrequency = "save",
        completionEnabled = true
      }
    }
  },
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
    init_options = {
      maxTsServerMemory = 3072,
      tsserver = {
        useSyntaxServer = 'never',
      },
      preferences = {
        disableSuggestions = true,

        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  },

  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        hint = { enable = true }
      }
    }
  },

  biome = {
    filetypes = { "typescript", "typescriptreact", "javascript", "html", "css", "svelte", "typescript.tsx" },
  },

  typos_lsp = {
    cmd_env = { RUST_LOG = "error" },
    init_options = {
      diagnosticSeverity = "hint",
    },
    filetypes = { "typescript", "typescriptreact", "javascript", "typescript.tsx", "markdown" },
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
