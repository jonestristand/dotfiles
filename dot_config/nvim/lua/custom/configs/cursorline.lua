return {
  'yamatsum/nvim-cursorline',
  event = "BufEnter",
  opts = {
    cursorline = {
      enabled = true,
      timeout = 1000,
      number = false
    },
    cursorword = {
      enabled = true,
      min_length = 3,
      hl = { underline = true },
    },
  },
  config = true
}
