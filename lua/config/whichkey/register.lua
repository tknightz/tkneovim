local wk = require("which-key")
local mappings = require("config.whichkey.mappings")

local function jump_to_window()
  local window = require("window-picker").pick_window()
  if window ~= nil then
    vim.api.nvim_set_current_win(window)
  end
end

local base_mappings = {
  f = mappings.file,
  w = mappings.editor.window,
  g = mappings.git,
  b = mappings.editor.buffer,
  m = mappings.modules,
  t = mappings.editor.terminal,
  e = mappings.editor.editing,
  s = mappings.searcher,
  l = mappings.lsp,
  q = mappings.editor.quit_and_sessions,
  p = mappings.project,
}

local function build_mode_mapping(mode)
  local lmappings = {}

  for key, val in pairs(base_mappings) do
    if val[mode] ~= nil then
      lmappings[key] = vim.tbl_deep_extend("keep", { name = val.name }, val[mode])
    end
  end

  return lmappings
end

-- build mode mappings
local normal_mappings = build_mode_mapping("normal")
local visual_mappings = build_mode_mapping("visual")

wk.register(
  vim.tbl_deep_extend("keep", normal_mappings, {
    -- not a group mappings
    j = { jump_to_window, "jump" },
    y = { "<cmd>%y+<cr>", "yank to clipboard" },
    n = { "<cmd>Neotree toggle<cr>", "neotree" },
  }),
  {
    prefix = "<Leader>",
    mode = "n",
  }
)

wk.register(
  vim.tbl_deep_extend("keep", visual_mappings, {
    -- not a group mappings
    j = { jump_to_window, "jump" },
    y = { '"+y', "yank to clipboard" },
    n = { "<cmd>Neotree toggle<cr>", "neotree" },
  }),
  {
    prefix = "<Leader>",
    mode = "v",
  }
)
