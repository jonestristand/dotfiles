return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  opts = {
    handle = {
      blend = 50
    },
    excluded_buftypes = {
      "terminal",
      "nofile",
    },
  }
}
