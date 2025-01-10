-- Find shortcuts
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in CWD" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find config files" })
vim.keymap.set("n", "<leader>fg", function()
	require("plugins.telescope.multigrep").live_multigrep()
end, { desc = "Multigrep Find" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })

-- Files and buffers
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Show Oil.nvim file explorer" })
vim.keymap.set(
	"n",
	"<leader>fT",
	"<cmd>Neotree show toggle reveal reveal_force_cwd<CR>",
	{ desc = "Show Neotree without focus" }
)
vim.keymap.set(
	"n",
	"<leader>ft",
	"<cmd>Neotree focus toggle left reveal_force_cwd<CR>",
	{ desc = "Show Neotree with focus " }
)

vim.keymap.set({ "n", "v", "i" }, "<C-s>", function()
	vim.cmd("write")
	vim.cmd("stopinsert")
end)
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<cmd>bdelete<CR>")

-- Folds
vim.keymap.set("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds" })
vim.keymap.set("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
local dimEnabled = false
vim.keymap.set("n", "<leader>cd", function()
	if dimEnabled then
		require("snacks").dim.disable()
		dimEnabled = false
	else
		require("snacks").dim()
		dimEnabled = true
	end
end)

-- LSP/Code stuff
vim.keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format current buffer" })
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Describe under cursor" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo List (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)

-- Git
vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle git blame" })

-- Terminals
vim.keymap.set("n", "<leader>t", function()
	vim.cmd.term()
	vim.cmd("startinsert")
end)

vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
	vim.cmd("startinsert")
end)

-- UI shortcuts
vim.keymap.set("n", "<leader>ut", "<cmd>Telescope themes<CR>")

-- Window shortcuts
local icon, hl, is_default = require("mini.icons").get("os", "arch")
require("which-key").add({
	"<leader>u",
	group = "UI Commands",
	icon = icon,
})
vim.keymap.set({ "n", "v", "i" }, "<A-l>", function()
	require("tmux").move_right()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-h>", function()
	require("tmux").move_left()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-k>", function()
	require("tmux").move_top()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-j>", function()
	require("tmux").move_bottom()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-L>", function()
	require("tmux").resize_right()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-H>", function()
	require("tmux").resize_left()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-K>", function()
	require("tmux").resize_top()
end)
vim.keymap.set({ "n", "v", "i" }, "<A-J>", function()
	require("tmux").resize_bottom()
end)

-- Cursor navigation
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
vim.keymap.set({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<C-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- Dynamically load/execute lua
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current buffer" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source current lua line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source current lua selection" })
