local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local function emptyString(s)
	return type(s) ~= "string" or string.len(s) == 0
end

return {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
		self.modeHl = self:getModeHl()
	end,
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg .. "_75" }
		end,
	},
	-- File encoding
	{
		hl = function(self)
			return {
				fg = self.modeHl.fg,
				bg = self.modeHl.bg .. "_75",
				italic = true,
			}
		end,
		{
			provider = function()
				local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
				return " " .. enc .. " "
			end,
		},
		{
			provider = function()
				local fileformat = vim.bo.fileformat
				if fileformat == "unix" then
					return "  "
				elseif fileformat == "dos" then
					return "  "
				elseif fileformat == "mac" then
					return "  "
				end
			end,
			hl = { italic = false },
		},
	},
	-- divider to main filename part
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg, bg = self.modeHl.bg .. "_75" }
		end,
	},
	-- Main bar
	{
		hl = function(self)
			return {
				fg = self.modeHl.fg,
				bg = self.modeHl.bg,
			}
		end,
		-- File icon
		-- 	{
		-- 		init = function(self)
		-- 			local filename = vim.fn.fnamemodify(self.filename, ":t")
		-- 			local extension = vim.fn.fnamemodify(filename, ":e")
		-- 			self.icon, self.icon_color =
		-- 				require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		-- 		end,
		-- 		provider = function(self)
		-- 			return self.icon and (" " .. self.icon .. " ") or " "
		-- 		end,
		-- 		--[[ hl = function(self)
		-- 			return { fg = self.icon_color }
		-- 		end, ]]
		-- 	},
		-- 	-- File name
		-- 	{
		-- 		provider = function(self)
		-- 			local filename = ""
		-- 			if emptyString(self.filename) then
		-- 				filename = "No Name"
		-- 			elseif vim.bo.buftype == "terminal" then
		-- 				filename = vim.fn.fnamemodify(self.filename, ":t")
		-- 			elseif vim.bo.buftype == "help" then
		-- 				filename = "Help: " .. vim.fn.fnamemodify(self.filename, ":t:r")
		-- 			elseif emptyString(vim.bo.buftype) then
		-- 				filename = vim.fn.fnamemodify(self.filename, ":.")
		-- 			else
		-- 				filename = vim.bo.filetype
		-- 			end
		-- 			if not conditions.width_percent_below(#filename, 0.25) then
		-- 				filename = vim.fn.pathshorten(filename)
		-- 			end
		-- 			return filename
		-- 		end,
		-- 		hl = { fg = "black", bold = true },
		-- 	},
		-- 	-- File modified
		-- 	{
		-- 		condition = function()
		-- 			return vim.bo.modified
		-- 		end,
		-- 		provider = "+",
		-- 	},
		-- 	-- File locked
		-- 	{
		-- 		condition = function()
		-- 			return vim.bo.readonly or not vim.bo.modifiable
		-- 		end,
		-- 		provider = " ",
		-- 	},
		-- 	{ provider = " " },
		-- },
		require("plugins.heirline.filename"),
	},
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg, bg = self.modeHl.bg .. "_75" }
		end,
	},
	-- file size
	{
		init = function(self)
			self.size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
		end,
		provider = function(self)
			local suffix = { "B", "KiB", "MiB", "GiB", "TiB", "PiB", "ExB" }
			local result = ""
			if self.size < 0 then
				result = "--"
			elseif self.size < 1024 then
				result = self.size .. suffix[1]
			else
				local i = math.floor((math.log(self.size) / math.log(1024)))
				result = string.format("%.2g%s", self.size / math.pow(1024, i), suffix[i + 1])
			end
			return " " .. result .. "  "
		end,
		hl = function(self)
			return {
				fg = self.modeHl.fg,
				bg = self.modeHl.bg .. "_75",
				italic = true,
			}
		end,
		update = { "OptionSet", "BufWritePost", "BufEnter", "WinEnter", "ModeChanged" },
	},
	{
		provider = "",
		hl = function(self)
			return { fg = self.modeHl.bg .. "_75" }
		end,
	},
}
