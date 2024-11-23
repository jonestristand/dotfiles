return {
  'mg979/vim-visual-multi',
  event = "BufRead",
  init = function()
    -- vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '',
      ['I BS'] = '', -- disable backspace mapping
    }
  end,
  config = function()
    vim.keymap.set('n', '<C-M>', '<Plug>(VM-Find-Under)')
  end,
}
