return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			"folke/lazydev.nvim",
		},
		config = function()
			require("mason").setup({
				ensure_installed = { "clangd", "clang-format", "codelldb" },
			})
			require("mason-lspconfig").setup()

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			--[[ capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    } ]]

			local on_attach_notify = function(lspClient, bufnr)
				vim.notify(
					"Attached '" .. lspClient.name .. "' to \nbuffer '" .. vim.api.nvim_buf_get_name(bufnr) .. "'!",
					vim.log.levels.INFO,
					{
						title = "LSP",
						timeout = 2000,
						style = "minimal",
					}
				)
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						-- on_attach = on_attach_notify,
					})
				end,
				["ts_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.ts_ls.setup({
						--[[ on_attach = function()
							print("TS_LS Attached")
						end, ]]
						-- on_attach = on_attach_notify,
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern("package.json"),
						single_file_support = false,
					})
				end,
				["denols"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.denols.setup({
						--[[ on_attach = function()
							print("DenoLS Attached")
						end, ]]
						-- on_attach = on_attach_notify,
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
					})
				end,
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
