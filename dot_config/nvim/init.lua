-- Map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

---@diagnostic disable-next-line: param-type-mismatch
if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
	---@diagnostic disable-next-line: param-type-mismatch
	vim.fn.chdir(vim.fn.argv(0))
end

if vim.g.vscode then
else
	-- Install and load lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			lazyrepo,
			lazypath,
		})
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end

	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		{ import = "plugins" },
		{ import = "plugins.languages" },
		-- { "peacock.nvim", dev = true, opts = {} },
	}, {
		dev = { path = "~/dev/nvimplugins/" },
		change_detection = {
			notify = true,
		},
	})

	-- Load saved color scheme
	require("current-theme")
	-- Load main config
	require("core")
end
