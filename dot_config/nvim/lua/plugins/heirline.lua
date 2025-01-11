return {
	"rebelot/heirline.nvim",
	dependencies = { "Zeioth/heirline-components.nvim" },
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")
		local heirline_components = require("heirline-components.all")

		-- Setup
		heirline_components.init.subscribe_to_events()
		heirline.load_colors(heirline_components.hl.get_colors())

		heirline.setup({
			---@diagnostic disable-next-line: missing-fields
			statusline = {
				require("plugins.heirline.mode"),
				heirline_components.component.mode({ mode_text = {}, surround = { separator = "right" } }),
				heirline_components.component.lsp({}),
			},
		})
	end,
}
