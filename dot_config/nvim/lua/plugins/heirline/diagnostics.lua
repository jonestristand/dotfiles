return {
	static = {
		error_icon = " ",
		warn_icon = " ",
		info_icon = " ",
		hint_icon = " ",
	},
	init = function(self)
		self.modeHl = self:getModeHl()
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	on_click = {
		callback = function()
			-- require("trouble").toggle({ mode = "document_diagnostics" })
			-- or
			vim.diagnostic.setqflist()
		end,
		name = "heirline_diagnostics",
	},
	update = { "DiagnosticChanged", "BufEnter", "ModeChanged" },
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg .. "_75", bg = self.modeHl.bg .. "_50" }
		end,
	},
	{
		hl = function(self)
			return { fg = self.modeHl.fg, bg = self.modeHl.bg .. "_75" }
		end,
		{ provider = " " },
		{
			provider = function(self)
				return self.error_icon
			end,
			hl = { fg = "red_50" },
		},
		{
			provider = function(self)
				return self.errors .. " "
			end,
			hl = { fg = "red_25" },
		},
		{
			provider = function(self)
				return self.warn_icon
			end,
			hl = { fg = "yellow_50" },
		},
		{
			provider = function(self)
				return self.warnings .. " "
			end,
			hl = { fg = "yellow_25" },
		},
		{
			provider = function(self)
				return self.hint_icon
			end,
			hl = { fg = "blue_50" },
		},
		{
			provider = function(self)
				return self.hints .. " "
			end,
			hl = { fg = "blue_25" },
		},
		{
			provider = function(self)
				return self.info_icon
			end,
			hl = { fg = "green_50" },
		},
		{
			provider = function(self)
				return self.info .. " "
			end,
			hl = { fg = "green_25" },
		},
	},
}
