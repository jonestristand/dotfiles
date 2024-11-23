return {
  "folke/which-key.nvim",
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)

    local ok, whichkey = pcall(require, "which-key")
    if not ok then
      return
    end
    whichkey.register({
      -- add group
          ["<leader>"] = {
            c = { name = "+code" },
            f = { name = "+find" },
            g = { name = "+git" },
            l = { name = "+lsp" },
            p = { name = "+pin" },
            t = { name = "+ui/themes" },
            w = { name = "+workspaces" },
            x = { name = "+trouble" },
          }
    })
  end,
  setup = function()
    require("core.utils").load_mappings("whichkey")
  end,
}
