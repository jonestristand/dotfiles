return {
  "folke/trouble.nvim",
  keys = { "<leader>xx", "<leader>xw", "<leader>xd", "<leader>xt" },
  cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

  }
}
