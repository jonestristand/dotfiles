local conditions = require("heirline.conditions")

return {
	static = {
		modeNames = {
			["n"] = "no",
			["no"] = "op",
			["nov"] = "op",
			["noV"] = "op",
			["no\22"] = "op",
			["niI"] = "no",
			["niR"] = "no",
			["niV"] = "no",
			["nt"] = "no",
			["ntT"] = "no",
			["v"] = "vi",
			["vs"] = "vi",
			["V"] = "vl",
			["Vs"] = "vl",
			["\22"] = "vb",
			["\22s"] = "vb",
			["s"] = "se",
			["S"] = "sl",
			["\19"] = "sb",
			["i"] = "in",
			["ic"] = "in",
			["ix"] = "in",
			["R"] = "re",
			["Rc"] = "re",
			["Rx"] = "re",
			["Rv"] = "vr",
			["Rvc"] = "vr",
			["Rvx"] = "vr",
			["c"] = "co",
			["cv"] = "ex",
			["ce"] = "ex",
			["r"] = "re",
			["rm"] = "mo",
			["r?"] = "c?",
			["!"] = "sh",
			["t"] = "tr",
		},
		modeHighlights = {
			no = { fg = "black", bg = "yellow" },
			["op"] = { fg = "black", bg = "cyan" },
			["in"] = { fg = "black", bg = "green" },
			vi = { fg = "black", bg = "red" },
			["vl"] = { fg = "black", bg = "red" },
			["vb"] = { fg = "black", bg = "red" },
			se = { fg = "black", bg = "red" },
			["sl"] = { fg = "black", bg = "red" },
			["sb"] = { fg = "black", bg = "red" },
			re = { fg = "black", bg = "purple" },
			mo = { fg = "black", bg = "purple" },
			["vr"] = { fg = "black", bg = "purple" },
			co = { fg = "black", bg = "blue" },
			ex = { fg = "black", bg = "blue" },
			["c?"] = { fg = "black", bg = "blue" },
			sh = { fg = "black", bg = "blue" },
			tr = {
				fg = "black",
				bg = "vibrant_green",
			},
		},
		getMode = function()
			return conditions.is_active() and vim.fn.mode(1) or "n"
		end,
		getModeName = function(self)
			return self.modeNames[self.getMode()] or "???"
		end,
		getModeHl = function(self)
			return self.modeHighlights[self:getModeName()] or { fg = "white" }
		end,
	},
	fallthrough = false,
	{
		condition = function()
			return conditions.buffer_matches({ buftype = { "nofile" } })
		end,
		{ provider = "" },
	},
	{
		condition = conditions.is_active,
		hl = function(self)
			return { bg = self:getModeHl().bg .. "_125" }
		end,
		require("plugins.heirline.macro"),
		require("plugins.heirline.mode"),
		require("plugins.heirline.cwd"),
		{ provider = "%=" },
		require("plugins.heirline.fileblock"),
		{ provider = "%=" },
		require("plugins.heirline.git"),
		require("plugins.heirline.diagnostics"),
		require("plugins.heirline.lsp"),
	},
	{
		{ provider = "%=" },
		{
			provider = "",
			hl = { fg = "grey_fg2" },
		},
		{
			hl = { bg = "grey_fg2" },
			require("plugins.heirline.filename"),
		},
		{
			provider = "",
			hl = { fg = "grey_fg2" },
		},
		{ provider = "%=" },
	},
}
