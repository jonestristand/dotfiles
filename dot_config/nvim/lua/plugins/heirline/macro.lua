local utils = require("heirline.utils")

return {
	condition = function()
		return vim.fn.reg_recording() ~= ""
	end,
	provider = " ",
	hl = { fg = "orange", bg = "statusline_bg", bold = true },
	utils.surround({ "[", "]" }, nil, {
		provider = function()
			return vim.fn.reg_recording()
		end,
		hl = { fg = "green", bold = true },
	}),
	update = {
		"RecordingEnter",
		"RecordingLeave",
	},
}
