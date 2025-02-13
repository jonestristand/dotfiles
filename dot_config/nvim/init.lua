---@diagnostic disable: param-type-mismatch
--  Map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.fn.argc() == 1 then
	local fsinfo = vim.loop.fs_stat(vim.fn.argv(0))
	if fsinfo and fsinfo.type == "directory" then
		vim.fn.chdir(vim.fn.argv(0))
	else
		vim.fn.chdir(vim.fn.fnamemodify(vim.fn.argv(0), ":h"))
	end
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
	}, {
		dev = { path = "~/Development/nvimplugins/" },
		change_detection = {
			notify = true,
		},
	})

	-- Load saved color scheme
	require("current-theme")

	-- Load main config
	require("core")
end
