local conditions = require("heirline.conditions")

return {
	init = function(self)
		self.modeHl = self:getModeHl()
		self.status_dict = vim.b.gitsigns_status_dict or { head = nil, added = 0, changed = 0, removed = 0 }
		self.has_changes = (self.status_dict.added and self.status_dict.added ~= 0)
			or (self.status_dict.removed and self.status_dict.removed ~= 0)
			or (self.status_dict.changed and self.status_dict.changed ~= 0)
	end,
	-- condition = conditions.is_git_repo,
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg .. "_50" }
		end,
	},
	{
		hl = function(self)
			return { fg = self.modeHl.fg, bg = self.modeHl.bg .. "_50" }
		end,
		{
			provider = function(self)
				return "  " .. (self.status_dict.head or "N/A")
			end,
			hl = { bold = true },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			{ provider = "(" },
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and "+" .. count or ""
				end,
				hl = { fg = "green" },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and "~" .. count or ""
				end,
				hl = { fg = "yellow" },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and "-" .. count or ""
				end,
				hl = { fg = "red" },
			},
			{ provider = ")" },
		},
		{ provider = " " },
	},
}
