return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			-- Allows to define text objects based on treesitter
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- Allows to define which comments to use dinamically (make sure to set the comment plugin integration!)
			-- "JoosepAlviste/nvim-ts-context-commentstring",
			-- Auto close/rename html tags
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line: missing-fields
			configs.setup({
				-- Languages to be automatically installed
				ensure_installed = {
					"markdown_inline",
					"regex",
					"lua",
					"typescript",
					"go",
					"html",
					"sql",
					"javascript",
					"java",
					"json",
					"vimdoc",
				},

				-- Autoinstall languages if they are not installed
				auto_install = true,

				matchup = {
					enable = false,
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = {},
				},

				--[[ textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["as"] = {
								query = "@local.scope",
								query_group = "locals",
								desc = "Select language scope",
							},
						},
					},
				}, ]]

				indent = {
					enable = true,
				},

				-- autotag = {
				--         enable = true,
				-- },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
