return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = "fast",
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
			float = {
				max_height = 0.75, -- 75% of screen height
				max_width = 0.75, -- 75% of screen width
				win_options = {
					winblend = 7,
				},
			},
			keymaps = {
				["<C-s>"] = false,
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
				["<Esc>"] = { callback = "actions.close", mode = "n" },
			},
		},
		dependencies = { "echasnovski/mini.nvim" },
	},
}
