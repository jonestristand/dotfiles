return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufRead",
	init = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	end,
	config = function()
		local filetypes = { nvdash = "" }

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return filetypes[filetype] or { "treesitter", "indent" }
			end,
			close_fold_kinds_for_ft = { "imports", "comment" },
		})
	end,
}
