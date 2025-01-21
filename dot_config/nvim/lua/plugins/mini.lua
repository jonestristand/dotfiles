return {
	{
		"echasnovski/mini.nvim",
		config = function()
			local icons = require("mini.icons")
			icons.setup({})

			-- local statusline = require("mini.statusline")
			-- statusline.setup({ use_icons = true })

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

			local git = require("mini.git")
			git.setup()

			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					--[[ { mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" }, ]]

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},

				window = {
					delay = 100,
					config = {
						width = "auto",
					},
				},
			})
		end,
	},
}
