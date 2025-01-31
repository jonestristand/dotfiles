local map = vim.keymap.set
-- stylua: ignore start

-- neovim keymaps
map("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Quit all" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Clear search on escape
map({ "i", "n", "s" }, "<esc>", function() vim.cmd("noh") return "<esc>" end, { expr = true, desc = "Escape and clear highlights" })

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
map("n", "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), }) end, { desc = "Find config files" })
map("n", "<leader>fg", function() require("plugins.telescope.multigrep").live_multigrep() end, { desc = "Multigrep Find" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })

-- Files and buffers
map("n", "<leader>e", "<cmd>Oil --float<CR>", { desc = "Show Oil.nvim" })
map("n", "<leader>fT", "<cmd>Neotree show toggle reveal reveal_force_cwd<CR>", { desc = "Show Neotree without focus" })
map("n", "<leader>ft", "<cmd>Neotree focus toggle left reveal_force_cwd<CR>", { desc = "Show Neotree with focus " })

map({ "n", "v", "i" }, "<C-s>", function() vim.cmd("write") vim.cmd("stopinsert") end)
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to other buffer" })
map("n", "<leader>`", "<cmd>e #<CR>", { desc = "Switch to other buffer" })
map("n", "<leader>bd", function() require("snacks").bufdelete() end, { desc = "Delete buffer" })
map("n", "<C-q>", function() require("snacks").bufdelete() end, { desc = "Delete buffer" })
map("n", "<leader>bo", function() require("snacks").bufdelete.other() end, { desc = "Delete other buffers" })
map("n", "<leader>bD", "<cmd>bd<CR>", { desc = "Delete buffer and window" })

-- Folds
map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })

-- LSP/Code stuff
require("snacks").toggle.dim():map("<leader>cd")
map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>cf", function() require("conform").format() end, { desc = "Format current buffer" })
map("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Describe under cursor" })
map( "n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch / Diff Update" })
map("n", "grd", function() vim.diagnostic.open_float({ border = "rounded" }) end, { desc = "Open diagnostics" })

-- Refactoring
map("x", "<leader>re", ":Refactor extract ", { desc = "Refactor extract to function" })
map("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor extract to file" })
map("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor extract variable" })
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Refactor inline variable" })
map( "n", "<leader>rI", ":Refactor inline_func", { desc = "Refactor inline function" })
map("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor extract block" })
map("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Refactor extract block to file" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo List (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map( "n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })

-- Debug
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "Set conditional breakpoint" })
map("n", "<leader>dL", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Set log point" })
map("n", "<leader>dd", function() require("dap").clear_breakpoints() end, { desc = "Clear breakpoints" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Run/Continue" })
map("n", "<leader>da", function() require("dap").continue({ before = require("utils.debug").get_args }) end, { desc = "Run with args" })
map("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" })
map("n", "<leader>dg", function() require("dap").goto_() end, { desc = "Go to Line (No Execute)" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<leader>dk", function() require("dap").up() end, { desc = "Up" })
map("n", "<leader>dj", function() require("dap").down() end, { desc = "Down" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run Last" })
map("n", "<leader>dP", function() require("dap").pause() end, { desc = "Pause" })
map("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<leader>ds", function() require("dap").session() end, { desc = "Session" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })

map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
map({ "n", "v" }, "<leader>de", function() require("dapui").eval() end, { desc = "Eval" })

map({ "", "i" }, "<F5>", function() require("dap").continue() end, { desc = "Continue debugging" })
map({ "", "i" }, "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map({ "", "i" }, "<F10>", function() require("dap").step_over() end, { desc = "Step over" })
map({ "", "i" }, "<F11>", function() require("dap").step_into() end, { desc = "Step into" })
map({ "", "i" }, "<F12>", function() require("dap").step_out() end, { desc = "Step out" })

-- Git
map("n", "<leader>gb", function() require("gitsigns").toggle_current_line_blame() end, { desc = "Toggle git blame" })
map("n", "<leader>gl", function() require("snacks").lazygit.open() end, { desc = "Open LazyGit" })

-- Terminals
map("n", "<leader>t", function() require("snacks").terminal.toggle() end, { desc = "Terminal (cwd)" })
map("t", "<esc>", "<C-\\><C-N>", { desc = "Close terminal" })

-- UI shortcuts
map("n", "<leader>ut", "<cmd>Telescope themes previewer=false<CR>")

-- Window shortcuts
map({ "n", "v", "i" }, "<A-l>", function() require("tmux").move_right() end)
map({ "n", "v", "i" }, "<A-h>", function() require("tmux").move_left() end)
map({ "n", "v", "i" }, "<A-k>", function() require("tmux").move_top() end)
map({ "n", "v", "i" }, "<A-j>", function() require("tmux").move_bottom() end)
map({ "n", "v", "i" }, "<A-L>", function() require("tmux").resize_right() end)
map({ "n", "v", "i" }, "<A-H>", function() require("tmux").resize_left() end)
map({ "n", "v", "i" }, "<A-K>", function() require("tmux").resize_top() end)
map({ "n", "v", "i" }, "<A-J>", function() require("tmux").resize_bottom() end)

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
require("snacks").toggle.zoom():map("<leader>wm"):map("<leader>uZ")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Cursor navigation
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "x", "o" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<C-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- Dynamically load/execute lua
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current buffer" })
map("n", "<leader>x", ":.lua<CR>", { desc = "Source current lua line" })
map("v", "<leader>x", ":lua<CR>", { desc = "Source current lua selection" })
-- stylua: ignore end
