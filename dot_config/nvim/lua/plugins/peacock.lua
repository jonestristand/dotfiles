return {
	"jonestristand/peacock.nvim",
	-- dev = true,
	opts = {
		picker = {
			ignore_list = { "*/runtime/colors/*", "mini*", "*light*", "*dawn*", "random*" },
		},
		harmony = {
			["nordic"] = {
				fetch = function()
					return require("nordic.colors")
				end,
				mapping = true,
			},
			["citruszest"] = {
				fetch = function()
					return require("citruszest.palettes.colors")
				end,
				mapping = true,
			},
			["kanagawa-paper"] = {
				fetch = function()
					return require("kanagawa-paper.colors").setup()["palette"]
				end,
				mapping = {
					white = "fujiWhite",
					darker_black = "sumiInk0",
					black = "sumiInk3",
					black2 = "dragonBlack4",
					red = "dragonRed",
					baby_pink = "dragonPink",
					pink = "sakuraPink",
					green = "dragonGreen",
					vibrant_green = "springGreen",
					nord_blue = "springBlue",
					blue = "dragonBlue",
					yellow = "dragonYellow",
					sun = "carpYellow",
					purple = "lotusViolet2",
					dark_purple = "lotusViolet4",
					teal = "lotusTeal2",
					orange = "dragonOrange",
					cyan = "lotusCyan",
					base00 = "sumiInk3",
					base01 = "sumiInk4",
					base02 = "sumiInk5",
					base03 = "sumiInk6",
					base04 = "fujiGray",
					base05 = "oldWhite",
					base06 = "lotusWhite0",
					base07 = "fujiWhite",
					base08 = "dragonRed",
					base09 = "dragonOrange",
					base0a = "dragonPink",
					base0b = "dragonGreen",
					base0c = "dragonAqua",
					base0d = "dragonBlue2",
					base0e = "dragonViolet",
					base0f = "dragonRed",
				},
			},
		},
	},
}
