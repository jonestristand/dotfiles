local colorutils = require("utils.colors")
return {
	"rebelot/heirline.nvim",
	dependencies = { "Zeioth/heirline-components.nvim" },
	lazy = false,
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		-- Setup
		local function setup_colors()
			local colors = {}
			if not vim.g.colors_name then
				colors = require("kanagawa.palette")
			else
				colors = require(vim.g.colors_name .. ".palette")
			end

			local colorlist = {}
			for color, value in pairs(colors) do
				colorlist[color] = value
				colorlist[color .. "_75"] = colorutils.lerprgb(value, colors["statusline_bg"], 0.75)
				colorlist[color .. "_50"] = colorutils.lerprgb(value, colors["statusline_bg"], 0.50)
				colorlist[color .. "_25"] = colorutils.lerprgb(value, colors["statusline_bg"], 0.25)
				colorlist[color .. "_125"] = colorutils.lerprgb(value, colors["statusline_bg"], 0.125)
				colorlist[color .. "_062"] = colorutils.lerprgb(value, colors["statusline_bg"], 0.0625)
			end
			return colorlist
		end

		heirline.load_colors(setup_colors())

		vim.api.nvim_create_augroup("Heirline", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				utils.on_colorscheme(setup_colors())
			end,
			group = "Heirline",
		})

		heirline.setup({
			statusline = require("plugins.heirline.statusLine"),
		})
	end,
}
