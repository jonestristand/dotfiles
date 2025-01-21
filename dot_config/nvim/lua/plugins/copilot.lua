return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			auto_trigger = true,
			hide_during_completion = false,
		},
	},
}
