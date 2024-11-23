return {
  'gnikdroy/projections.nvim',
  branch = "pre_release",
  event = "VeryLazy",
  opts = {
    workspaces = {
      { "~/dev",       {} },
      { "~/.dotfiles", {} }
    },
    store_hooks = {
      pre = function()
        local nvim_tree_present, api = pcall(require, "nvim-tree.api")
        if nvim_tree_present then api.tree.close() end
      end
    },
    --[[ restore_hooks = {
      post = function()
        require("nvim-tree.api").tree.change_root(vim.fn.getcwd(-1, -1))
      end
    } ]]
  },
  config = function(_, opts)
    require('projections').setup(opts)
    -- vim.opt.sessionoptions:append("localoptions") -- Save localoptions to session file
    vim.opt.sessionoptions:remove("folds") -- Don't save folds to session file

    require('telescope').load_extension('projections')

    -- Autostore session on VimExit
    local session = require("projections.session")
    vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
      callback = function() session.store(vim.fn.getcwd(-1, -1)) end,
    })

    -- If vim was started with arguments, do nothing
    -- If in some project's root, attempt to restore that project's session
    -- If not, restore last session
    -- If no sessions, do nothing
    --[[ local switcher = require("projections.switcher")
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        if vim.fn.argc() ~= 0 then return end

        local session_info = session.info(vim.fn.getcwd(-1, -1))
        if session_info == nil then
          session.restore_latest()
        else
          session.restore(vim.fn.getcwd(-1, -1))
        end
      end,
      desc = "Restore last session automatically"
    })

    vim.api.nvim_create_autocmd({ "DirChanged" }, {
      callback = function()
        print("DirChanged!")
      end,
    }) ]]
  end,
}
