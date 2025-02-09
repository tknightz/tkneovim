local util = require("lspconfig.util")
local lsputils = require("config.lsp.utils")
local preset = require("config.lsp.preset")
local build_keymaps = require("lib").build_keymaps

local M = {}

M.general_configs = {
  capabilities = preset.capabilities,
  flags = {
    debounce_text_changes = 1000,
  },
  init_options = { hostInfo = "neovim" },
}

M.configs = {
  gopls = {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
  },

  tailwindcss = {
    filetypes = { "css", "html", "svelte", "javascriptreact", "typescriptreact", "astro" },
    root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
  },

  cssls = {
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },

  emmet_language_server = {
    filetypes = { "javascriptreact", "typescriptreact", "svelte" },
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
      "markdown",
    },
    settings = {
      ltex = {
        enabled = { "latex", "markdown", "org" },
        setenceCacheSize = 5000,
        additionalRules = { enablePickyRules = true },
        -- flags = { debounce_text_changes = 1000 },
        checkFrequency = "save",
        completionEnabled = true,
      },
    },
  },

  tsserver = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
    settings = {
      diagnostics = { ignoredCodes = { 6133 } },
    },
    init_options = {
      maxTsServerMemory = 3072,
      tsserver = {
        useSyntaxServer = "never",
      },
      preferences = {
        disableSuggestions = true,

        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        hint = { enable = true },
      },
    },
  },

  biome = {
    cmd = { lsputils.get_local_binary("biome"), "lsp-proxy" },
    filetypes = { "typescript", "typescriptreact", "javascript", "html", "css", "svelte", "typescript.tsx" },
  },

  typos_lsp = {
    cmd_env = { RUST_LOG = "error" },
    init_options = {
      diagnosticSeverity = "hint",
    },
    filetypes = { "typescript", "typescriptreact", "javascript", "typescript.tsx", "markdown", "lua" },
  },

  harper_ls = {
    filetypes = { "markdown", "txt" },
    linters = {
      spell_check = true,
      spelled_numbers = false,
      an_a = true,
      sentence_capitalization = true,
      unclosed_quotes = true,
      wrong_quotes = false,
      long_sentences = true,
      repeated_words = true,
      spaces = true,
      matcher = true,
      correct_number_suffix = true,
      number_suffix_capitalization = true,
      multiple_sequential_pronouns = true,
    },
  },

  vtsls = {
    settings = {
      complete_function_calls = true,
      diagnostics = { ignoredCodes = { 6133 } },
      vtsls = {
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
            entriesLimit = 30,
          },
        },
      },
      typescript = {
        tsserver = {
          nodePath = "/usr/lib/electron32/electron",
          maxTsServerMemory = 3072,
        },
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
    },

    keys = {
      {
        "gd",
        function()
          local params = vim.lsp.util.make_position_params(0, "utf-16")
          lsputils.execute({
            command = "typescript.goToSourceDefinition",
            arguments = { params.textDocument.uri, params.position },
            open = true,
          })
        end,
        desc = "Go to definition",
      },
      { "<leader>lO", lsputils.action["source.organizeImports"], desc = "Organize imports" },
      { "<leader>lC", lsputils.action["source.removeUnused.ts"], desc = "Remove unused code" },
      { "<leader>lF", lsputils.action["source.fixAll.ts"], desc = "Fix all code" },
      { "<leader>lI", lsputils.action["source.addMissingImports.ts"], desc = "Add missing imports" },
    },
  },
}

M.build_server_config = function(server)
  local server_config = M.configs[server]
  local default_on_attach = require("config.lsp.preset").on_attach

  if not server_config then
    local config = M.general_configs
    config.on_attach = default_on_attach
    return config
  end

  local default_keymaps = require("config.lsp.preset").on_attach_keymaps
  local custom_keymaps = server_config.keys and server_config.keys or {}

  local keymaps = vim.tbl_extend("force", default_keymaps, custom_keymaps)
  local on_attach = function(client, bufnr)
    require("config.lsp.preset").on_attach(client, bufnr)
    build_keymaps(bufnr, keymaps)
  end

  local config = server_config and vim.tbl_extend("force", M.general_configs, server_config) or M.general_configs
  config.on_attach = on_attach

  return config
end

return M
