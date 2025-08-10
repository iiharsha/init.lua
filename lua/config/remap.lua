local set = vim.keymap.set

vim.g.mapleader = ' '

set('n', '<leader><leader>x', '<cmd>source %<CR>')
set('n', '<leader>x', ':.lua<CR>')
set('v', '<leader>x', ':lua<CR>')

set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

set('n', '<leader>ca', vim.lsp.buf.code_action)

set('n', 'J', 'mzJ`z') --joins lines
--scrolling functions
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
-- navigating for the search results
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- clipboard remaps
set({ 'n', 'v' }, '<leader>y', [["+y]])
set('n', '<leader>Y', [["+Y]])

set({ 'n', 'v' }, '<leader>d', [["_d]])

set('i', 'jj', '<Esc>')

set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
set('n', '<leader>f', vim.lsp.buf.format)

set('n', '<C-k>', '<cmd>cnext<CR>zz')
set('n', '<C-j>', '<cmd>cprev<CR>zz')
set('n', '<leader>k', '<cmd>lnext<CR>zz')
set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- search and replace
set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- command line write smoothening
local opts = { noremap = true, silent = false }
set('n', ';', ':', opts)
