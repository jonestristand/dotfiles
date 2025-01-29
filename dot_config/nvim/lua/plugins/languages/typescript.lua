return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "kyoh86/climbdir.nvim" },
	opts = {
		on_attach = function(client)
			-- Fix go to definition keymap
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "Go to Definition (TS) " })
			vim.keymap.set("n", "<leader>cR", "<cmd>TSToolsRenameFile<CR>", { desc = "Rename File (TS)" })
			vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", { desc = "Organize Imports (TS)" })
			-- Disable formatting
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
		root_dir = function(path)
			local marker = require("climbdir.marker")
			return require("climbdir").climb(
				path,
				marker.one_of(marker.has_readable_file("package.json"), marker.has_directory("node_modules")),
				{
					halt = marker.one_of(
						marker.has_readable_file("deno.json"),
						marker.has_readable_file("deno.jsonc"),
						marker.has_readable_file("import_map.json"),
						marker.has_directory("denops")
					),
				}
			)
		end,
		single_file_support = false,
	},
}
