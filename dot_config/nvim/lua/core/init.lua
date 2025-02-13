_G.dd = function(...)
	require("snacks").debug.inspect(...)
end
_G.bt = function()
	require("snacks").debug.backtrace()
end
vim.print = _G.dd

require("core.autocommands")
require("core.keymaps")
require("core.prefs")
require("core.filetypes")
