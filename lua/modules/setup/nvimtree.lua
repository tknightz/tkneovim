function setup()
	local g = vim.g
	g.nvim_tree_indent_markers = 1
	g.nvim_tree_git_hl = 1
	g.nvim_tree_root_folder_modifier = ":t"
	g.nvim_tree_highlight_opened_files = 1
	g.nvim_tree_allow_resize = 0
	g.nvim_tree_icon_padding = '  '

	g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
	}

	g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "✗",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "★"
		},
		folder = {
			default = "",
			arrow_open = "",
			arrow_closed = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = ""
		},
		lsp = {
			hint = '',
			info = "",
			warning = "",
			error = ""
		}
	}
end

setup()
