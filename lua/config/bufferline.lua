local highlights = require("onedark.bufferline")
local special_fts = require("lib.consts").special_fts

require("bufferline").setup({
  highlights = highlights,
  options = {
    offsets = {
      { filetype = "NvimTree", text = "Explorer" },
      { filetype = "neo-tree", text = "Explorer" },
      { filetype = "dbui", text = "DB Explorer" },
      { filetype = "DiffviewFiles", text = "DiffviewFiles" },
    },
    themable = true,
    buffer_close_icon = "",
    modified_icon = "",
    indicator = {
      style = "underline",
      -- icon = "|",
    },
    close_icon = "",
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = false,
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
      local icon = " "
      if level:match("error") then
        icon = " "
      elseif level:match("warn") then
        icon = " "
      elseif level:match("hint") then
        icon = " "
      end
      return icon .. "(" .. count .. ")"
    end,
    custom_filter = function(buf_number, _)
      -- filter out filetypes you don't want to see
      local ft = vim.bo[buf_number].filetype
      if vim.tbl_contains(special_fts, ft) then
        return false
      end

      local bufname = vim.fn.bufname(buf_number)
      return vim.fn.empty(vim.fn.matchstr(bufname, '^fugitive://')) ~= 0
    end,
  },
})


local opt = { silent = true }
local map = vim.keymap.set
--
-- -- MAPPINGS
-- map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
-- map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
