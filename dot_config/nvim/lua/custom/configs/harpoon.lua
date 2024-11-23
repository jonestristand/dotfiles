return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    require("harpoon").setup({})

    require("telescope").load_extension("harpoon")

  end,
}
