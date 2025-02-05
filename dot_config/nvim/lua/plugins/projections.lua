return {
	enabled = false,
	"jonestristand/projections.nvim",
	opts = {
		workspaces = {
			"~/dev",
		},
		patterns = {
			".git",
			".gitignore",
			".gitmodules",
			".hg",
			".bzr",
			".svn",
			"Makefile",
			"package.json",
			"yarn.lock",
			"package-lock.json",
			"node_modules",
			"vendor",
			"Gemfile",
			"Gemfile.lock",
			"composer.json",
			"composer.lock",
			"Cargo.toml",
			"Cargo.lock",
			"go.sum",
			"tsconfig.json",
			"jsconfig.json",
			"phpunit.xml",
		},
	},
	config = function(_, opts)
		require("projections").setup(opts)

		-- require("telescope").load_extension("projections")

		-- Autostore session on VimExit
		-- local Session = require("projections.session")
		-- vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
		-- 	callback = function()
		-- 		Session.store(vim.uv.cwd())
		-- 	end,
		-- })

		-- Switch to project if vim was started in a project dir
		-- local switcher = require("projections.switcher")
		-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
		-- 	callback = function()
		-- 		if vim.fn.argc() == 0 then
		-- 			switcher.switch(vim.uv.cwd())
		-- 		end
		-- 	end,
		-- })
		--
		-- local Workspace = require("projections.workspace")
		-- -- Add workspace command
		-- vim.api.nvim_create_user_command("AddWorkspace", function()
		-- 	Workspace.add(vim.uv.cwd())
		-- end, {})
	end,
}
