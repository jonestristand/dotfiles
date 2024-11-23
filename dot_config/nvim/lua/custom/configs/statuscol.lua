return {
  "luukvbaal/statuscol.nvim",
  event = "VimEnter",
  config = function()
    local builtin = require("statuscol.builtin")

    vim.opt.fillchars:append("foldopen:󰅀")
    vim.opt.fillchars:append("foldclose:󰄾")
    vim.opt.fillchars:append("foldsep:│")

    require('statuscol').setup({
      relculright = true,
      setopt = true,
      ft_ignore = {
        "help",
        "vim",
        "fugitive",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "noice",
        "lazy",
        "toggleterm",
        "nvdash",
      },
      bt_ignore = {
        "nvdash",
        "nofile"
      },
      segments = {
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
          click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        {
          sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa"
        },
        { text = { " " } },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa", maxwidth = 2, colwidth = 2 },
        { text = { " " } },
        {
          sign = {
            namespace = { "gitsign" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
            fillchar = " ",
            fillcharhl = "StatusColumnSeparator",
          },
          click = "v:lua.ScSa",
        },
     }
    })
  end
}
