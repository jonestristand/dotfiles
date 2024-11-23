local plugins = {
	{
		require("custom.configs.hyper"),
	},
	{
		"hrsh7th/nvim-cmp",
		opts = { -- function()
			-- local conf = require('plugins.configs.cmp')
			-- local cmp = require('cmp')
			--
			-- conf.mapping = {
			--   ["<C-p>"] = cmp.mapping.select_prev_item(),
			--   ["<C-n>"] = cmp.mapping.select_next_item(),
			--   ["<C-d>"] = cmp.mapping.scroll_docs(-4),
			--   ["<C-f>"] = cmp.mapping.scroll_docs(4),
			--   ["<C-Space>"] = cmp.mapping.complete(),
			--   ["<C-e>"] = cmp.mapping.close(),
			mapping = {
				["<CR>"] = require("cmp").mapping({
					i = function(fallback)
						if require("cmp").visible() and require("cmp").get_active_entry() then
							require("cmp").confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = require("cmp").mapping.confirm({ select = true }),
					c = require("cmp").mapping.confirm({
						behavior = require("cmp").ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				["<C-CR>"] = require("cmp").mapping.confirm({
					behavior = require("cmp").ConfirmBehavior.Replace,
					select = false,
				}),
			},
			--     ["<Tab>"] = cmp.mapping(function(fallback)
			--       if cmp.visible() then
			--         cmp.select_next_item()
			--       elseif require("luasnip").expand_or_jumpable() then
			--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			--       else
			--         fallback()
			--       end
			--     end, {
			--       "i",
			--       "s",
			--     }),
			--     ["<S-Tab>"] = cmp.mapping(function(fallback)
			--       if cmp.visible() then
			--         cmp.select_prev_item()
			--       elseif require("luasnip").jumpable(-1) then
			--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			--       else
			--         fallback()
			--       end
			--     end, {
			--       "i",
			--       "s",
			--       }),
			--     }
			--   return conf
			-- end
		},
	},
	require("custom.configs.notify"),
	require("custom.configs.nvimtree"),
	require("custom.configs.vim-visual-multi"),
	require("custom.configs.noice"),
	require("custom.configs.gitsigns"),
	require("custom.configs.statuscol"),
	require("custom.configs.ufo"),
	require("custom.configs.cursorline"),
	require("custom.configs.substitute"),
	require("custom.configs.arrow"),
	require("custom.configs.flash"),
	require("custom.configs.todo"),
	require("custom.configs.scrollbar"),
	require("custom.configs.shade"),
	require("custom.configs.hbac"),
	require("custom.configs.early-retirement"),
	require("custom.configs.ai"),
	require("custom.configs.symbols-outline"),
	require("custom.configs.trouble"),
	require("custom.configs.aerial"),
	require("custom.configs.surround"),
	require("custom.configs.projections"),
	require("custom.configs.better-escape"),
	require("custom.configs.vim-tmux-navigator"),
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	require("custom.configs.conform"),
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"typst-lsp",
				"clangd",
				"clang-format",
				"codelldb",
				"typescript-language-server",
				"prettier",
				"stylua",
				"intelephense",
				"python-lsp-server",
				"gopls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	require("custom.configs.which-key"),
}
return plugins
