local M = {}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<leader>fp"] = { "<cmd> Telescope projections<CR>", "load a previously opened project" },

		["<leader>cv"] = {
			function()
				vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
			end,
			"toggle virtual text",
		},

		["<leader>cw"] = { "<cmd>set wrap!<CR>", "toggle line wrapping" },

		["<leader>bs"] = { "<cmd> w<CR>", "save buffer" },
	},
}

M.trouble = {
	n = {
		["<leader>xx"] = {
			function()
				require("trouble").toggle()
			end,
			"toggle trouble window",
		},
		["<leader>xw"] = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			"toggle trouble workspace diagnostic window",
		},
		["<leader>xd"] = {
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			"toggle trouble document diagnostic window",
		},
		["<leader>xl"] = {
			function()
				require("trouble").toggle("loclist")
			end,
			"toggle trouble loclist window",
		},
		["<leader>xq"] = {
			function()
				require("trouble").toggle("quickfix")
			end,
			"toggle trouble quickfix window",
		},
	},
}

--[[ M.harpoon = {
  n = {
    ["<leader>fh"] = { function() require("telescope").extensions.harpoon.marks({ prompt_title = "harpoon 2!" }) end, "open harpoon window" },
    ["<leader>a"] = { function() require("harpoon"):list():append() end, "add harpoon" },

    ["<M-1>"] = { function() require("harpoon"):list():select(1) end, "Select harpoon 1" },
    ["<M-2>"] = { function() require("harpoon"):list():select(2) end, "Select harpoon 2" },
    ["<M-3>"] = { function() require("harpoon"):list():select(3) end, "Select harpoon 3" },
    ["<M-4>"] = { function() require("harpoon"):list():select(4) end, "Select harpoon 4" },
    ["<M-5>"] = { function() require("harpoon"):list():select(5) end, "Select harpoon 5" },
    ["<M-6>"] = { function() require("harpoon"):list():select(6) end, "Select harpoon 6" },
    ["<M-7>"] = { function() require("harpoon"):list():select(7) end, "Select harpoon 7" },
    ["<M-8>"] = { function() require("harpoon"):list():select(8) end, "Select harpoon 8" },
    ["<M-9>"] = { function() require("harpoon"):list():select(9) end, "Select harpoon 9" },
    ["<M-0>"] = { function() require("harpoon"):list():select(0) end, "Select harpoon 0" },

    ["<M-S-P>"] = { function() require("harpoon"):list():prev() end, "Select previous harpoon" },
    ["<M-S-N>"] = { function() require("harpoon"):list():next() end, "Select next harpoon" },

    ["<leader>hh"] = { function() vim.notify(vim.inspect(require("harpoon"):list():display())) end, "" },
    ["<leader>ha"] = { function() require("harpoon"):ui():toggle_quick_menu() end, "" },
  }
} ]]

M.hbac = {
	n = {
		["<leader>fb"] = {
			function()
				require("telescope").extensions.hbac.buffers({ prompt_title = "HBAC Buffers" })
			end,
			"find buffers",
		},

		["<C-w>p"] = {
			function()
				require("hbac").toggle_pin()
			end,
			"toggle hbac pin",
		},
		["<leader>pa"] = {
			function()
				require("hbac").pin_all()
			end,
			"pin all buffers",
		},
		["<leader>pu"] = {
			function()
				require("hbac").unpin_all()
			end,
			"unpin all buffers",
		},
		["<C-w>c"] = {
			function()
				require("hbac").close_unpinned()
			end,
			"close unpinned buffers",
		},
	},
}

M.shade = {
	n = {
		["<leader>s"] = {
			function()
				require("shade").toggle()
			end,
			"toggle shade",
		},
	},
}

M.todo_comments = {
	n = {
		["]t"] = {
			function()
				require("todo-comments").jump_next()
			end,
			"next todo",
		},
		["[t"] = {
			function()
				require("todo-comments").jump_prev()
			end,
			"previous todo",
		},
		["<leader>xt"] = { "<cmd> TodoTrouble<CR>", "todos" },
		["<leader>ft"] = { "<cmd> TodoTelescope<CR>", "todos" },
	},
}

M.substitute = {
	n = {
		["s"] = {
			function()
				require("substitute").operator()
			end,
			"substitute",
		},
		["ss"] = {
			function()
				require("substitute").line()
			end,
			"substitute line",
		},
		["S"] = {
			function()
				require("substitute").eol()
			end,
			"substitute eol",
		},
	},
}

return M
