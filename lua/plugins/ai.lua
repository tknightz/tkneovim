return {
  {
    "yetone/avante.nvim",
    cmd = { "AvanteChat", "AvanteToggle" },
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      mode = "legacy",
      provider = "gemini",
      cursor_applying_provider = "groq",
      behaviour = {
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },
      providers = {
        gemini = {
          -- @see https://ai.google.dev/gemini-api/docs/models/gemini
          model = "gemini-2.5-flash",
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          max_tokens = 50768,
        },
        groq = { -- define groq provider
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.3-70b-versatile",
          extra_request_body = {
            max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
          }
        },
      },

      input = {
        provider = "snacks",
        provider_opts = {
          -- Additional snacks.input options
          title = "Avante Input",
          icon = " ",
        },
      },

      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffDelete",
          incoming = "DiffAdd",
        },
      },

      selector = {
        provider = "snacks",
        provider_opts = {},
      },

      -- rag_service = {
      --   enabled = true,
      --   provider = "ollama",
      --   endpoint = "http://localhost:11434",
      --   host_mount = os.getenv("HOME"),
      --   llm_model = "phi3:mini", -- Try a much smaller model
      --   embed_model = "nomic-embed-text", -- This should be okay
      -- }
      -- system_prompt = function()
      --   local hub = require("mcphub").get_hub_instance()
      --   return hub:get_active_servers_prompt()
      -- end,
      -- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      -- custom_tools = function()
      --   return {
      --     require("mcphub.extensions.avante").mcp_tool(),
      --   }
      -- end,
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "folke/snacks.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.icons",
    },
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- comment the following line to ensure hub will be ready at the earliest
    cmd = "MCPHub", -- lazy load by default
    module = "mcphub",
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    config = function()
      require("mcphub").setup({
        extensions = {
          avante = {
            make_slash_commands = true,
          },
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          trigger_on_accept = true,
          keymap = {
            accept = "<C-k>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    cmd = { "CopilotChat", "CopilotChatToggle" },
    opts = {},
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanionChat" },
    opts = {
      adapters = {
        gemini = {
          env = {
            api_key = "GEMINI_API_KEY",
          },
          schema = {
            model = {
              default = "gemini-2.5-flash-preview",
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        cmd = {
          adapter = "gemini",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },

  -- Supermaven - AI assistant
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-k>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-l>",
        },
      })
    end,
    cmd = { "SupermavenUseFree", "SupermavenStart" },
  },

  {
    "azorng/goose.nvim",
    cmd = { "Goose" },
    config = function()
      require("goose").setup({
        default_global_keymaps = false,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },
}
