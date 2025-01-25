return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "Eval",
				mode = { "n", "v" },
			},
		},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				require("dapui").open()
			end
			dap.listeners.before.launch.dapui_config = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				require("dapui").close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"mfussenegger/nvim-dap",
				dependencies = { "rcarriga/nvim-dap-ui" },
				config = function()
					vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
					vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")

					-- vim.cmd("hi DapBreakpointColor guibg=red")
					vim.fn.sign_define("DapBreakpoint", {
						text = "󱠇",
						texthl = "DapBreakpointColor",
						linehl = "DapBreakpoint",
						numhl = "DapBreakpointColor",
					})
					vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped" })
				end,
			},
			{ "theHamsta/nvim-dap-virtual-text", opts = { commented = true } },
		},
		opts = {
			handlers = {},
		},
	},
	--[[ {
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "Eval",
				mode = { "n", "v" },
			},
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup(opts)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{

		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},

			config = function() end,
		},
	}, ]]
}
