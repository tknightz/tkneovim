local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local layout_actions = require("telescope.actions.layout")

local _, telescope = pcall(require, "telescope")

local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selected_entry = action_state.get_selected_entry()

  if selected_entry == nil then
    actions.close(prompt_bufnr)
    return
  end

  local num_selections = #picker:get_multi_selection()

  if num_selections == 0 then
    return actions.file_edit(prompt_bufnr)
  end

  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end

  actions.send_selected_to_qflist(prompt_bufnr)
  vim.cmd("silent cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "split")
end
function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end
function telescope_custom_actions.multi_selection_open(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

telescope.setup({
  defaults = {
    cycle_layout_list = { "horizontal", "vertical", "center", "bottom_pane" },
    mappings = {
      i = {
        ["<M-h>"] = layout_actions.toggle_preview,
        ["<M-i>"] = layout_actions.toggle_prompt_position,
        ["<M-o>"] = layout_actions.toggle_mirror,
        ["<M-n>"] = layout_actions.cycle_layout_next,
        ["<M-p>"] = layout_actions.cycle_layout_prev,
        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,
        ["<Esc>"] = actions.close,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<C-i>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-a>"] = actions.select_all,
        ["<C-u>"] = actions.drop_all,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.select_horizontal,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--ignore-file",
      "--hidden",
      "--column",
      "--smart-case",
    },
    layout_config = {
      prompt_position = "top",

      horizontal = {
        width = 0.8,
        mirror = false,
        preview_cutoff = 40,
        preview_width = 0.7,
      },
      vertical = {
        width = 0.5,
        height = 0.7,
        mirror = false,
        preview_cutoff = 60,
        preview_width = 0.7,
      },
      center = {
        width = 0.4,
        mirror = false,
        preview_cutoff = 40,
      },
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
        prompt_position = "top",
        preview_width = 0.7,
      },
    },
    prompt_prefix = " 🧭 ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = { "node_modules", ".next", "build", ".git/.*", "%.min.js", "%.min.css", "%.map" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = previewers.buffer_previewer_maker,
  },
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<CR>"] = telescope_custom_actions.multi_selection_open,
          ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
        },
      },
      previewer = false,
      theme = "dropdown",
      find_command = { "rg", "--ignore", "--hidden", "--files" },
      file_ignore_patterns = {
        "node_modules",
        "%.gif",
        "%.png",
        "%.jpg",
        "%.jpeg",
        "%.webp",
        "%.ico",
        "%.min.js",
        "%.min.css",
        "%.map",
        ".git/.*",
      },
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      default_selection_index = 1,
      mappings = {
        i = {
          ["<c-x>"] = "delete_buffer",
        },
      },
    },
    live_grep = {
      layout_strategy = "horizontal",
    },
  },
  symbols = {
    sources = { "emoji", "kaomoji", "gitmoji", "math", "latex" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "svg", "gif" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      workspaces = {
        ["nvim"] = "/home/tulen/.config/nvim",
        ["alacritty"] = "/home/tulen/.config/alacritty",
      },
    },
    project = {
      hidden_files = true,
    },
    termfinder = {
      start_to_insert = true,
    },
  },
})

pcall(require("telescope").load_extension, "fzf") -- superfast sorter
pcall(require("telescope").load_extension, "projects") -- project
pcall(require("telescope").load_extension, "live_grep_args") -- live_grep_raw
pcall(require("telescope").load_extension, "termfinder")
