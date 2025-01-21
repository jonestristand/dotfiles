return {
	init = function(self)
		self.modeName = self:getModeName()
		self.modeHl = self:getModeHl()
	end,
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
	provider = function(self)
		return " " .. self.modeName .. " "
	end,
	hl = function(self)
		return { fg = "black", bg = self.modeHl.bg }
	end,
	{
		provider = "\u{e0bc}",
		hl = function(self)
			return {
				fg = self.modeHl.bg,
				bg = self.modeHl.bg .. "_75",
			}
		end,
	},
}
