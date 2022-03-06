vim.o.completeopt = "menu,menuone,noselect"
local cmp = require'cmp'

cmp.setup({
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    ['('] = cmp.mapping(function(fallback)
      cmp.mapping.complete()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("()<left>", true, false, true), "n", true)
    end, { 'i', 's' }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'emoji' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require('modules.config.lspconfig.icons').icons[vim_item.kind] .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        emoji = "[Emoji]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        spell = "[Spell]",
        treesitter = "[Treesitter]",
        nvim_lua = "[Neovim]",
      })[entry.source.name]

      return vim_item
    end,
  },

  confirmation = {
    get_commit_characters = function(commit_characters)
      return vim.tbl_filter(function(char)
        return char ~= ','
      end, commit_characters)
    end
  },

  experimental = {
    ghost_text = false
  }
})
