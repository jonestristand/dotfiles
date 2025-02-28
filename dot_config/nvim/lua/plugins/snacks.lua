return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type Snacks.Config
	opts = {
		dashboard = { enabled = true, example = "compact_files" },
		notifier = { enabled = true },
		dim = { enabled = true },
		bigfile = { enabled = true },
		toggle = {},
		terminal = {},
		lazygit = {},
		picker = {
			ui_select = true,
		},
	},
}
