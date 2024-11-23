local opts = {
  attach_mode = "global",
  layout = {
    default_direction = "prefer_right"
  },
  close_automatic_events = { "unfocus", "switch_buffer", "unsupported" },
  show_guides = true,
}

return {
  'stevearc/aerial.nvim',
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  },
  opts = opts
}
