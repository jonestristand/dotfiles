return {
  'simrat39/symbols-outline.nvim',
--  event = 'VeryLazy',
  -- lazy = false,
  keys = {
    { "<leader>co", "<Cmd>SymbolsOutline<CR>", desc = "Code Outline" },
  },
  cmd = "SymbolsOutline",
  config = function()
    require('symbols-outline').setup({})
  end,
}
