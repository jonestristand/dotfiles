vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }

vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.autoread = true

-- vim.opt.autochdir = true

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.smartindent = true

vim.opt.showmode = false

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

--[[ vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" ]]
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.g.markdown_fenced_languages = {
	"ts=typescript",
	"lua=lua",
}

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})
