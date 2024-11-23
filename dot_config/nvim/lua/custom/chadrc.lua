---@type ChadrcConfig
local M = {}
local header_art = require("custom.configs.nvdash")

math.randomseed(os.time())

M.ui = { theme = 'kanagawa' }
M.ui.hl_override = {
  Comment = { italic = true },
  ["@comment"] = { italic = true },
}

M.ui.nvdash = {
  load_on_startup = true,

  header = header_art[math.random(#header_art)],
  buttons = {
    { "  Find File", "Spc f f", "Telescope find_files" },
    { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    { "  Open a Project", "Spc f p", "Telescope neovim-project history" },
    { "  Find a New Project", "Spc f p d", "Telescope neovim-project discover" },
    { "  Themes", "Spc t h", "Telescope themes" },
    { "  Mappings", "Spc c h", "NvCheatsheet" },
  }
}

M.ui.tabufline = {
  enabled = false
}

--[[ M.ui.statusline = {
  separator_style = "round",
  overriden_modules = function(modules)
    local cur_buf = vim.api.nvim_get_current_buf();
    local pin_state = require("hbac.state").is_pinned(cur_buf) and  "📍" or " "

    table.insert(modules, 3, (function() return pin_state end)())
  end,
} ]]

M.ui.telescope = {
  style = "bordered"
}

M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")

return M
