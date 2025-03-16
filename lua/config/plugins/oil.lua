return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        columns = { 'icon', 'size' },
        keymaps = {
          ['C-h'] = false,
          ['M-h'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      --open parent directory in a floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
