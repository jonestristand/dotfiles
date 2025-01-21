local conditions = require("heirline.conditions")
local function emptyString(s)
	return type(s) ~= "string" or string.len(s) == 0
end

return {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	-- File icon
	{
		init = function(self)
			local filename = vim.fn.fnamemodify(self.filename, ":t")
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color =
				require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		end,
		provider = function(self)
			return self.icon and (" " .. self.icon .. " ") or " "
		end,
	},
	-- File name
	{
		provider = function(self)
			local filename = ""
			if emptyString(self.filename) then
				filename = "No Name"
			elseif vim.bo.buftype == "terminal" then
				filename = vim.fn.fnamemodify(self.filename, ":t")
			elseif vim.bo.buftype == "help" then
				filename = "Help: " .. vim.fn.fnamemodify(self.filename, ":t:r")
			elseif emptyString(vim.bo.buftype) then
				filename = vim.fn.fnamemodify(self.filename, ":.")
			else
				filename = vim.bo.filetype
			end
			if not conditions.width_percent_below(#filename, 0.33) then
				filename = vim.fn.pathshorten(filename)
			end
			return filename
		end,
		hl = { bold = true },
	},
	-- File modified
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "+",
	},
	-- File locked
	{
		condition = function()
			return vim.bo.readonly or not vim.bo.modifiable
		end,
		provider = " ",
	},
	{ provider = " " },
}
