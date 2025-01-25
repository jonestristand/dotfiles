map = vim.keymap.set

-- neovim keymaps
map("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Quit all" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Clear search on escape
map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and clear highlights" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Find shortcuts
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in CWD" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find config files" })
map("n", "<leader>fg", function()
	require("plugins.telescope.multigrep").live_multigrep()
end, { desc = "Multigrep Find" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })

-- Files and buffers
map("n", "<leader>e", "<cmd>Oil --float<CR>", { desc = "Show Oil.nvim" })
map("n", "<leader>fT", "<cmd>Neotree show toggle reveal reveal_force_cwd<CR>", { desc = "Show Neotree without focus" })
map("n", "<leader>ft", "<cmd>Neotree focus toggle left reveal_force_cwd<CR>", { desc = "Show Neotree with focus " })

map({ "n", "v", "i" }, "<C-s>", function()
	vim.cmd("write")
	vim.cmd("stopinsert")
end)
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map({ "n", "i", "v" }, "<C-q>", "<cmd>bdelete<CR>")

-- Folds
map("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds" })
map("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
local dimEnabled = false
map("n", "<leader>cd", function()
	if dimEnabled then
		require("snacks").dim.disable()
		dimEnabled = false
	else
		require("snacks").dim()
		dimEnabled = true
	end
end, { desc = "Dim inactive code blocks" })

-- LSP/Code stuff
map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Format current buffer" })
map("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Describe under cursor" })
map("n", "<leader>ch", "<cmd>noh<cr>", { desc = "Clear highlights" })
map("n", "grd", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Open diagnostics" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo List (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)

-- Debug
map("", "<F5>", require("dap").continue, { desc = "Continue debugging" })
map("", "<F10>", require("dap").step_over, { desc = "Step over" })
map("", "<F11>", require("dap").step_into, { desc = "Step into" })
map("", "<F12>", require("dap").step_out, { desc = "Step out" })
map("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

-- Git
map("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle git blame" })

-- Terminals
map("n", "<leader>t", function()
	vim.cmd.term()
	vim.cmd("startinsert")
end)

map("n", "<leader>ts", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
	vim.cmd("startinsert")
end)

map("t", "<esc>", "<C-\\><C-N>", { desc = "Close terminal" })

-- UI shortcuts
map("n", "<leader>ut", "<cmd>Telescope themes previewer=false<CR>")

-- Window shortcuts
local icon, hl, is_default = require("mini.icons").get("os", "arch")
--[[ require("which-key").add({
	"<leader>u",
	group = "UI Commands",
	icon = icon,
}) ]]
map({ "n", "v", "i" }, "<A-l>", function()
	require("tmux").move_right()
end)
map({ "n", "v", "i" }, "<A-h>", function()
	require("tmux").move_left()
end)
map({ "n", "v", "i" }, "<A-k>", function()
	require("tmux").move_top()
end)
map({ "n", "v", "i" }, "<A-j>", function()
	require("tmux").move_bottom()
end)
map({ "n", "v", "i" }, "<A-L>", function()
	require("tmux").resize_right()
end)
map({ "n", "v", "i" }, "<A-H>", function()
	require("tmux").resize_left()
end)
map({ "n", "v", "i" }, "<A-K>", function()
	require("tmux").resize_top()
end)
map({ "n", "v", "i" }, "<A-J>", function()
	require("tmux").resize_bottom()
end)

-- Cursor navigation
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
map({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map("c", "<C-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- Dynamically load/execute lua
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current buffer" })
map("n", "<leader>x", ":.lua<CR>", { desc = "Source current lua line" })
map("v", "<leader>x", ":lua<CR>", { desc = "Source current lua selection" })
