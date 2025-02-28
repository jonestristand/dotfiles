return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"andrew-george/telescope-themes",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin_schemes = require("telescope._extensions.themes").builtin_schemes

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
				},
				mappings = {
					n = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			pickers = {
				lsp_references = {
					theme = "ivy",
				},
				find_files = {
					follow = true,
				},
			},
			extensions = {
				fzf = {},
				persisted = {
					layout_config = {
						width = 0.5,
						height = 0.5,
					},
				},
				themes = {
					enable_live_preview = true,
					ignore = vim.list_extend(
						builtin_schemes,
						{ "randomhue", "minicyan", "minischeme", "randombones", "vimbones", "zenbones" }
					),
					light_themes = {
						ignore = true,
						keywords = { "light", "day", "latte", "dawn" },
					},
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("themes")
	end,
}
