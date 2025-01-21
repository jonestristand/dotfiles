-- local conditions = require("heirline.conditions")

return {
	init = function(self)
		self.modeHl = self:getModeHl()
	end,
	on_click = {
		callback = function()
			vim.defer_fn(function()
				vim.cmd("LspInfo")
			end, 100)
		end,
		name = "heirline_LSP",
	},
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg, bg = self.modeHl.bg .. "_75" }
		end,
	},
	{
		hl = function(self)
			return { fg = self.modeHl.fg, bg = self.modeHl.bg }
		end,
		{ provider = " " },
		{
			update = { "LspAttach", "LspDetach", "ModeChanged" },

			provider = function()
				local names = {}
				for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
					table.insert(names, server.name)
				end
				return "  [" .. table.concat(names, ", ") .. "] "
			end,
		},
	},
}
