return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		on_attach = function()
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "Go to Definition (TS) " })
		end,
	},
}
