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
	return string.format("#%x%x%x", rgb[1], rgb[2], rgb[3])
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

return M
