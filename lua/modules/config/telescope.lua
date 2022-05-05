local actions = require('telescope.actions')
local finders = require('telescope.finders')
local action_state = require('telescope.actions.state')
local action_set = require('telescope.actions.set')
local previewers = require("telescope.previewers")
local layout_actions = require('telescope.actions.layout')

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

telescope.setup {
  defaults = {
    cycle_layout_list = {"horizontal", "vertical", "center", "bottom_pane"},
    mappings = {
      i = {
        ["<M-h>"] = layout_actions.toggle_preview,
        ["<M-i>"] = layout_actions.toggle_prompt_position,
        ["<M-o>"] = layout_actions.toggle_mirror,
        ["<M-n>"] = layout_actions.cycle_layout_next,
        ["<M-p>"] = layout_actions.cycle_layout_prev,
        ["<esc>"] = actions.close,
        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,
        ["<C-v>"] = actions.file_vsplit,
        ["<C-s>"] = actions.file_split,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ['<CR>'] = telescope_custom_actions.multi_selection_open,
        ['<C-v>'] = telescope_custom_actions.multi_selection_open_vsplit,
        ['<C-s>'] = telescope_custom_actions.multi_selection_open_split,
        ['<C-t>'] = telescope_custom_actions.multi_selection_open_tab,
        ['<C-l>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<C-a>'] = actions.select_all,
        ['<C-u>'] = actions.drop_all,
        ['<CR>'] = telescope_custom_actions.multi_selection_open,
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
        preview_width = 0.7
      },
      vertical = {
        width = 0.5,
        height = 0.7,
        mirror = false,
        preview_cutoff = 60,
        preview_width = 0.7
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
        preview_width = 0.7
      },
    },
    prompt_prefix = " 🧭 ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_ignore_patterns = {"%node_modules%", "build", ".git/.*", "%.min.js", "%.min.css", "%.map"},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = previewers.buffer_previewer_maker
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = "dropdown",
      find_command = {"rg", "--ignore", "--hidden", "--files"},
      file_ignore_patterns = { "%.gif", "%.png", "%.jpg", "%.jpeg", "%.webp", "%.ico", "%.min.js", "%.min.css", "%.map", ".git/.*" },
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      default_selection_index = 1,
      attach_mappings = function(prompt_bufnr, map)
        local ok_ez, ezterm = pcall(require, 'ezterm')
        local ok_eza, ezaction = pcall(require, 'ezterm.actions')

        if ok_ez then
          map('i', '<C-t>', ezaction.change_direction_top)
          map('i', '<C-l>', ezaction.change_direction_left)
          map('i', '<C-r>', ezaction.change_direction_right)
          map('i', '<C-b>', ezaction.change_direction_bottom)
        end

        action_set.select:replace(function(prompt_bufnr, type)
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if pcall(function() vim.api.nvim_buf_get_var(entry.bufnr, "ezterm") end) then
            ezterm.open_term(entry.bufnr)
          else
            vim.api.nvim_win_set_buf(0, entry.bufnr)
          end
        end)
        return true
      end 
    },
  },
	symbols = {
		sources = {'emoji', 'kaomoji', 'gitmoji', 'math', 'latex'}
	},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg", "svg", "gif"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    frecency = {
      show_scores     = true,
      show_unindexed  = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      workspaces = {
        ["nvim"]      = "/home/tulen/.config/nvim",
        ["alacritty"] = "/home/tulen/.config/alacritty",
      },
    },
    ezterm = {
      theme = "dropdown",
      enter_insert = true,
      previewer = true
    },
    project = {
      hidden_files = true
    }
  }
}


pcall(require("telescope").load_extension, "fzf") -- superfast sorter
pcall(require("telescope").load_extension, "project") -- project
pcall(require("telescope").load_extension, "ezterm") -- ezterm
pcall(require("telescope").load_extension, "live_grep_raw") -- live_grep_raw
