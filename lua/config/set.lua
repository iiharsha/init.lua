vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.colorcolumn = '80'
vim.opt.laststatus = 3

local augroup = vim.api.nvim_create_augroup
local HarshaGroup = augroup('Harsha', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require('plenary.reload').reload_module(name)
end

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 40,
    }
  end,
})

autocmd({ 'BufWritePre' }, {
  group = HarshaGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Appearance of diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
      return string.format('%s %s', code, diagnostic.message)
    end,
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
  -- Make diagnostic background transparent
  on_ready = function()
    vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  end,
}

autocmd('LspAttach', {
  group = HarshaGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set('n', '<leader>vws', function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set('n', '<leader>vd', function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set('n', '<leader>vca', function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set('n', '<leader>vrr', function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set('n', '<leader>vrn', function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set('i', '<C-h>', function()
      vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})
