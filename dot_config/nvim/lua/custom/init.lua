vim.cmd([[if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif]])

vim.opt.colorcolumn = "120"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevelstart = 3
