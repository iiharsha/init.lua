return {
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  -- {
  --   -- Autoclose parentheses, brackets, quotes, etc.
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = true,
  --   opts = {},
  -- },
  {
  'echasnovski/mini.statusline', -- More specific
  config = function()
    require('mini.statusline').setup({ use_icons = true })
  end,
},
  {
    'ChuufMaster/buffer-vacuum',
    opts = {},
  },
}
