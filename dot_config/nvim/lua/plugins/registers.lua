return {
	"tversteeg/registers.nvim",
	cmd = "Registers",
	config = true,
	keys = {
		{ '"', mode = { "n", "v" } },
		{ "<C-R>", mode = "i" },
	},
	opts = {
		window = {
			border = "single",
			opacity = 0,
		},
	},
}
