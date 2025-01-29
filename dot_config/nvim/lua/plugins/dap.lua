---@diagnostic disable: unused-local
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
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
			"mfussenegger/nvim-dap",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
		config = function()
			require("mason-nvim-dap").setup({
				handlers = {},
				automatic_installation = true,
				ensure_installed = { "codelldb" },
			})

			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			---@diagnostic disable-next-line: duplicate-set-field
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_stringify(str))
			end

			local palette = require("utils.colors").getcolors()
			local blended_red = require("utils.colors").lerprgb(palette.red, palette.base00, 0.35)
			local blended_orange = require("utils.colors").lerprgb(palette.orange, palette.base00, 0.4)
			local blended_yellow = require("utils.colors").lerprgb(palette.yellow, palette.base00, 0.25)
			local blended_green = require("utils.colors").lerprgb(palette.green, palette.base00, 0.25)
			local blended_blue = require("utils.colors").lerprgb(palette.blue, palette.base00, 0.25)
			local blended_purple = require("utils.colors").lerprgb(palette.purple, palette.base00, 0.25)

			vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = blended_red })
			vim.api.nvim_set_hl(0, "DapBreakpointWithFg", { bg = blended_red, fg = palette.red })
			vim.fn.sign_define("DapBreakpoint", {
				text = "󱠇",
				texthl = "DapBreakpointWithFg",
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})

			vim.api.nvim_set_hl(0, "DapBreakpointCondition", { bg = blended_orange })
			vim.api.nvim_set_hl(0, "DapBreakpointConditionWithFg", { bg = blended_orange, fg = palette.orange })
			vim.fn.sign_define("DapBreakpointCondition", {
				text = "",
				texthl = "DapBreakpointConditionWithFg",
				linehl = "DapBreakpointCondition",
				numhl = "DapBreakpointCondition",
			})

			vim.api.nvim_set_hl(0, "DapLogPoint", { bg = blended_blue })
			vim.api.nvim_set_hl(0, "DapLogPointWithFg", { bg = blended_blue, fg = palette.blue })
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "DapLogPointWithFg", linehl = "DapLogPoint", numhl = "DapLogPoint" }
			)

			vim.api.nvim_set_hl(0, "DapBreakpointRejected", { bg = blended_purple })
			vim.api.nvim_set_hl(0, "DapBreakpointRejectedWithFg", { bg = blended_purple, fg = palette.purple })
			vim.fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DapBreakpointRejectedWithFg",
				linehl = "DapBreakpointRejected",
				numhl = "DapBreakpointRejected",
			})

			vim.api.nvim_set_hl(0, "DapStopped", { bg = blended_blue })
			vim.api.nvim_set_hl(0, "DapStoppedWithFg", { bg = blended_blue, fg = palette.blue })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStoppedWithFg", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
	},
}
