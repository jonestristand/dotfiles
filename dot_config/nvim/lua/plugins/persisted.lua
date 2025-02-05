return {
	"olimorris/persisted.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	lazy = false, -- make sure the plugin is always loaded at startup
	opts = {
		use_git_branch = true,
	},
	config = function(_, opts)
		require("persisted").setup(opts)

		require("telescope").load_extension("persisted")
	end,
}
