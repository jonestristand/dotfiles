return {
	{
		"echasnovski/mini.nvim",
		config = function()
			local icons = require("mini.icons")
			icons.setup({})

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = true })

			local move = require("mini.move")
			move.setup({
				mappings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",

					line_left = "<C-h>",
					line_down = "<C-j>",
					line_up = "<C-k>",
					line_right = "<C-l>",
				},
			})

			local surround = require("mini.surround")
			surround.setup({
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",
				},
			})

			local pairs = require("mini.pairs")
			pairs.setup()

			local cursorword = require("mini.cursorword")
			cursorword.setup()

			local bufremove = require("mini.bufremove")
			bufremove.setup()
		end,
	},
}
