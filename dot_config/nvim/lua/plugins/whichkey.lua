return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		---@class wk.Opts
		opts = {
			preset = "modern",
			delay = 500,
			spec = {},
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
