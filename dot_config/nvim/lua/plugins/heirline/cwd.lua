local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

return {
	init = function(self)
		self.modeHl = self:getModeHl()
	end,
	{
		hl = function(self)
			return { fg = self.modeHl.fg, bg = self.modeHl.bg .. "_75" }
		end,
		provider = function()
			local icon = "  "
			local cwd = vim.fn.getcwd(0)
			cwd = vim.fn.fnamemodify(cwd, ":~")
			if not conditions.width_percent_below(#cwd, 0.25) then
				cwd = vim.fn.pathshorten(cwd)
			end
			local trail = cwd:sub(-1) == "/" and "" or "/"
			return icon .. cwd .. trail .. " "
		end,
	},
	{
		provider = "\u{e0bc}",
		hl = function(self)
			return { fg = self.modeHl.bg .. "_75" }
		end,
	},
}
