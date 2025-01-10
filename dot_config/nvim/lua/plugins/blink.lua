return { -- optional blink completion source for require statements and module annotations
	"saghen/blink.cmp",
	version = "0.8.2",
	tag = "v0.8.2",
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			list = {
				selection = "auto_insert",
			},
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description" }, { "source_name" } },
				},
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				window = { border = "rounded" },
			},
		},
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
}
