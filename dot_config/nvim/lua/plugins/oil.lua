return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["<C-s>"] = false,
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
			},
		},
		dependencies = { "echasnovski/mini.nvim" },
	},
}
