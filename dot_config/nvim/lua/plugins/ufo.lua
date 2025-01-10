return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
		event = "VeryLazy",
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			---@diagnostic disable-next-line: missing-fields
			require("ufo").setup({
				provider_selector = function(--[[ bufnr, filetype, buftype ]])
					return { "treesitter", "indent" }
				end,
				open_fold_hl_timeout = 400,
				close_fold_kinds_for_ft = {
					default = { "imports", "comment" },
				},
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						winblend = 5,
					},
					mappings = {
						scrollU = "<C-u>",
						scrollD = "<C-d>",
						jumpTop = "[",
						jumpBot = "]",
					},
				},
				fold_virt_text_handler = handler,
			})
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				ignore_ft = { "snacks_dashboard" },
				relculright = true,
				segments = {
					-- { text = { "a" } },
					{
						sign = { name = { ".*" }, namespace = { ".*" }, maxwidth = 1, colwidth = 2, foldclosed = true },
						click = "v:lua.ScSa",
					},
					-- { text = { "b" } },
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					-- { text = { "c" } },
					{
						sign = {
							namespace = { "gitsigns_signs_" },
							maxwidth = 1,
							colwidth = 1,
							auto = true,
							wrap = true,
							foldclosed = true,
						},
						click = "v:lua.ScSa",
					},
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					-- { text = { "d" } },
				},
			})
		end,
	},
}
