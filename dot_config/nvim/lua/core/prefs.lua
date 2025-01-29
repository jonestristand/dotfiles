vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.fillchars = { eob = " " }

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamed,unnamedplus"
vim.opt.autoread = true

vim.opt.cursorline = true

vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true

vim.opt.virtualedit = "block"

vim.opt.smartindent = true

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = "longest:full,full"

vim.opt.inccommand = "nosplit"
vim.opt.jumpoptions = "view"
vim.opt.showmode = false
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.opt.list = true
vim.opt.listchars = {
	tab = "  ",
	trail = "•",
	nbsp = "␣",
}

vim.opt.pumblend = 10
vim.opt.pumheight = 10

vim.opt.winminwidth = 5

vim.opt.mouse = "a"

vim.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.opt.spelllang = { "en_us", "medical" }

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

--[[ vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" ]]
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldcolumn = "2"
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

vim.g.snacks_animate = true
