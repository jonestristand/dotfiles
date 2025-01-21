return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = false,
		lazy = true,
		---@class wk.Opts
		opts = {
			preset = "modern",
			delay = 500,
			spec = {},
			plugins = {
				presets = {
					operators = false,
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
