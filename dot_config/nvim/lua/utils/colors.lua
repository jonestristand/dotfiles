local M = {}

---comment
---@param hex any
---@return table
M.hex2rgb = function(hex)
	local hex = hex:gsub("#", "")
	local r, g, b = tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
	return { r, g, b }
end

M.rgb2hex = function(rgb)
	local r = math.min(255, math.max(0, rgb[1]))
	local g = math.min(255, math.max(0, rgb[2]))
	local b = math.min(255, math.max(0, rgb[3]))
	return string.format("#%02x%02x%02x", r, g, b)
end

---comment
---@param color1 any
---@param color2 any
---@param f any
---@return table
M.lerpcolor = function(color1, color2, f)
	local r = color1[1] * f + color2[1] * (1 - f)
	local g = color1[2] * f + color2[2] * (1 - f)
	local b = color1[3] * f + color2[3] * (1 - f)

	return { r, g, b }
end

---Linearly interpolate two colors provided as hex-coded strings
---@param color1 string first color as hex-coded string ("#rrggbb")
---@param color2 string second color as hex-coded string ("#rrggbb")
---@param f number mixing fraction. 1.0 = all color1, 0.0 = all color2
---@return string resulting colors as hex-coded string ("#rrggbb")
M.lerprgb = function(color1, color2, f)
	return M.rgb2hex(M.lerpcolor(M.hex2rgb(color1), M.hex2rgb(color2), f))
end

---
---@param rgb any
---@return table
M.rgb2lab = function(rgb)
	local r = rgb[1] / 255
	local g = rgb[2] / 255
	local b = rgb[3] / 255

	r = r <= 0.04045 and r / 12.92 or ((r + 0.055) / 1.055) ^ 2.4
	g = g <= 0.04045 and g / 12.92 or ((g + 0.055) / 1.055) ^ 2.4
	b = b <= 0.04045 and b / 12.92 or ((b + 0.055) / 1.055) ^ 2.4
	local X = 0.4124 * r + 0.3576 * g + 0.1805 * b
	local Y = 0.2126 * r + 0.7152 * g + 0.0722 * b
	local Z = 0.0193 * r + 0.1192 * g + 0.9502 * b
	X = X * 100
	Y = Y * 100
	Z = Z * 100

	local function f1(t)
		return t > 0.0088564516790356 and t ^ 0.3333333333333333
			or 0.3333333333333333 * 23.3611111111111111 * t + 0.1379310344827586
	end

	local yon = f1(Y / 100)
	local L = 11 * yon - 16
	local a = 500 * (f1(X / 95.047) - yon)
	local b_ = 200 * (yon - f1(Z / 108.883))

	return { L, a, b_ }
end

---comment
---@param rgb1 any
---@param rgb2 any
---@return number
M.color_distance = function(rgb1, rgb2)
	if
		#rgb1 ~= 3
		or #rgb2 ~= 3
		or type(rgb1[1]) ~= "number"
		or type(rgb1[2]) ~= "number"
		or type(rgb1[3]) ~= "number"
		or type(rgb2[1]) ~= "number"
		or type(rgb2[2]) ~= "number"
		or type(rgb2[3]) ~= "number"
	then
		return 1000000
	end
	local lab1 = M.rgb2lab(rgb1)
	local lab2 = M.rgb2lab(rgb2)

	local kL = 1
	local kC = 1
	local kH = 1
	local K1 = 0.045
	local K2 = 0.015

	local da = lab1[2] - lab2[2]
	local db = lab1[3] - lab2[3]

	local dLstar = lab1[1] - lab2[1]
	local C1star = math.sqrt(lab1[2] ^ 2 + lab1[3] ^ 2)
	local C2star = math.sqrt(lab2[2] ^ 2 + lab2[3] ^ 2)
	local dCstar = C1star - C2star

	local dHstar = math.sqrt(da ^ 2 + db ^ 2 - dCstar ^ 2)

	local SL = 1
	local SC = 1 + K1 * C1star
	local SH = 1 + K2 * C1star

	local deltaE = math.sqrt((dLstar / (kL * SL)) ^ 2 + (dCstar / (kC * SC)) ^ 2 + (dHstar / (kH * SH)) ^ 2)

	-- local E = math.sqrt((lab1[1] - lab2[1]) ^ 2 + (lab1[2] - lab2[2]) ^ 2 + (lab1[3] - lab2[3]) ^ 2)
	return deltaE
end

M.getcolors = function()
	local base46_template = {
		white = "#ffffff",
		darker_black = "#000000",
		black = "#222222",
		black2 = "#272727",
		one_bg = "#303030",
		one_bg2 = "#353535",
		one_bg3 = "#3a3a3a",
		grey = "#444444",
		grey_fg = "#4d4d4d",
		grey_fg2 = "#535353",
		light_grey = "#5c5c5c",
		red = "#ff0000",
		baby_pink = "#ffb7ce",
		pink = "#ff8da1",
		line = "#313131",
		green = "#00aa00",
		vibrant_green = "#00ff00",
		nord_blue = "#00aaff",
		blue = "#0000ff",
		yellow = "#ffcc00",
		sun = "#ffff00",
		purple = "#9d00ff",
		dark_purple = "#500099",
		teal = "#00eeaa",
		orange = "#ff8800",
		cyan = "#00ffff",
		statusline_bg = "#222222",
		lightbg = "#333333",
		pmenu_bg = "#9d00ff",
		folder_bg = "#00aaff",
		base00 = "#222222",
		base01 = "#2a2a37",
		base02 = "#494949",
		base03 = "#363636",
		base04 = "#4c4c4c",
		base05 = "#c8c8c8",
		base06 = "#d2d2d2",
		base07 = "#dcdcdc",
		base08 = "#ff0000",
		base09 = "#ffaa55",
		base0A = "#ffcc00",
		base0B = "#00ff00",
		base0C = "#0000ff",
		base0D = "#00aaff",
		base0E = "#500099",
		base0F = "#ff0000",
	}

	local config = {
		default_theme = "kanagawa",
		default_subfile = "palette",
		deafult_method = nil,
		default_field = nil,
		["nordic"] = {
			subfile = "colors",
			mapping = true,
		},
		["kanagawa-paper"] = {
			subfile = "colors",
			method = "setup",
			field = "palette",
			mapping = {
				white = "fujiWhite",
				darker_black = "sumiInk0",
				black = "sumiInk3",
				black2 = "dragonBlack4",
				one_bg = "",
				one_bg2 = "",
				one_bg3 = "",
				grey = "",
				grey_fg = "",
				grey_fg2 = "",
				light_grey = "",
				red = "dragonRed",
				baby_pink = "dragonPink",
				pink = "sakuraPink",
				line = "",
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
				statusline_bg = "",
				lightbg = "",
				pmenu_bg = "",
				folder_bg = "",
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
				base0A = "dragonPink",
				base0B = "dragonGreen",
				base0C = "dragonAqua",
				base0D = "dragonBlue2",
				base0E = "dragonViolet",
				base0F = "dragonRed",
			},
		},
		["citruszest"] = {
			subfile = "palettes.colors",
			mapping = true,
		},
	}

	local get_palette = function(theme_name, subfile, method, field)
		local result = {}
		if subfile then
			result = require(theme_name .. "." .. subfile)
		else
			result = require(theme_name)
		end

		if method then
			result = result[method]()
		end

		if field then
			result = result[field]
		end

		return result
	end

	local get_closest_color = function(palette, template_color)
		local closest_color = nil
		local closest_distance = 1000000
		for _, color in pairs(palette) do
			if type(color) == "string" then
				local distance = M.color_distance(M.hex2rgb(color), M.hex2rgb(template_color))
				if distance < closest_distance then
					closest_distance = distance
					closest_color = color
				end
			end
		end
		return closest_color
	end

	local theme_name = vim.g.colors_name or config.default_theme
	local theme_config = config[theme_name] or nil
	local theme_subfile = theme_config and theme_config.subfile or config.default_subfile
	local theme_method = theme_config and theme_config.method or config.default_method
	local theme_field = theme_config and theme_config.field or config.default_field

	local palette = get_palette(theme_name, theme_subfile, theme_method, theme_field)

	local mapped_palette = {}
	if theme_config and theme_config.mapping then
		if theme_config.mapping == true then
			theme_config.mapping = {}
		end
		for color_name, template in pairs(base46_template) do
			if theme_config.mapping[color_name] and theme_config.mapping[color_name] ~= "" then
				mapped_palette[color_name] = palette[theme_config.mapping[color_name]]
			else
				mapped_palette[color_name] = get_closest_color(palette, template)
			end
		end
	else
		mapped_palette = palette
	end

	return mapped_palette
end

return M
