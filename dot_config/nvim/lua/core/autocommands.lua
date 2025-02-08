-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"TelescopePrompt",
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"floaterm",
		"null-ls-info",
		"notify",
		"qf",
		"oil",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>q!<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Customize terminal on open
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Create swatch highlights on ColorScheme change
local function create_swatches()
	local palette = require("utils.colors").getcolors()
	for name, color in pairs(palette) do
		vim.api.nvim_set_hl(0, "Swatch_" .. name, { bg = color })
	end
	vim.api.nvim_set_hl(0, "Swatch00", { fg = palette.base00 })
	vim.api.nvim_set_hl(0, "Swatch01", { fg = palette.base01 })
	vim.api.nvim_set_hl(0, "Swatch02", { fg = palette.base02 })
	vim.api.nvim_set_hl(0, "Swatch03", { fg = palette.base03 })
	vim.api.nvim_set_hl(0, "Swatch04", { fg = palette.base04 })
	vim.api.nvim_set_hl(0, "Swatch05", { fg = palette.base05 })
	vim.api.nvim_set_hl(0, "Swatch06", { fg = palette.base06 })
	vim.api.nvim_set_hl(0, "Swatch07", { fg = palette.base07 })
	vim.api.nvim_set_hl(0, "Swatch08", { fg = palette.base08 })
	vim.api.nvim_set_hl(0, "Swatch09", { fg = palette.base09 })
	vim.api.nvim_set_hl(0, "Swatch0A", { fg = palette.base0A })
	vim.api.nvim_set_hl(0, "Swatch0B", { fg = palette.base0B })
	vim.api.nvim_set_hl(0, "Swatch0C", { fg = palette.base0C })
	vim.api.nvim_set_hl(0, "Swatch0D", { fg = palette.base0D })
	vim.api.nvim_set_hl(0, "Swatch0E", { fg = palette.base0E })
	vim.api.nvim_set_hl(0, "Swatch0F", { fg = palette.base0F })
end
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("custom-colors", { clear = true }),
	callback = create_swatches,
})
create_swatches()
