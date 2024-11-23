return {
  "al-ce/hbac.nvim",
  branch = "fix/recursive_mappings",
  event = "VeryLazy",
  config = function()
    require("hbac").setup({})

    -- Telescope extension
    require("telescope").load_extension("hbac")
  end,
}
