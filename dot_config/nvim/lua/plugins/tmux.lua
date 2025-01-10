return {
	"aserowy/tmux.nvim",
	config = function()
		return require("tmux").setup({
			navigation = {
				enable_default_keybindings = false,
				cycle_navigation = false,
			},
			resize = {
				enable_default_keybindings = false,
			},
		})
	end,
}
