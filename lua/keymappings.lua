local utils = require('utils')

utils.map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

-- Open new empty tab
utils.map('n', '<C-t>', ':tabnew<CR>')

-- Nativate in tabs
utils.map('n', '<Leader>1', ':tabn 1<CR>')
utils.map('n', '<Leader>2', ':tabn 2<CR>')
utils.map('n', '<Leader>3', ':tabn 3<CR>')
utils.map('n', '<Leader>4', ':tabn 4<CR>')
utils.map('n', '<Leader>5', ':tabn 5<CR>')
utils.map('n', '<Leader>6', ':tabn 6<CR>')
utils.map('n', '<Leader>7', ':tabn 7<CR>')
utils.map('n', '<Leader>8', ':tabn 8<CR>')
utils.map('n', '<Leader>9', ':tabn 9<CR>')

-- Altenate shortcut to save
utils.map('n', '<C-s>', ':w<CR>')
utils.map('n', '<C-w>', ':x!<CR>')
utils.map('n', '<C-q>', ':q<CR>')
utils.map('n', '<C-c>', '<ESC>')

-- Navigate in windows
utils.map('n', '<C-Left>', '<C-w>h')
utils.map('n', '<C-Down>', '<C-w>j')
utils.map('n', '<C-Up>', '<C-w>k')
utils.map('n', '<C-Right>', '<C-w>l')

-- Duplicate lines
utils.map('n', '<C-S-d>', '<ESC>yyp')
utils.map('v', '<C-S-d>', '<ESC>yyp')

-- Set uppercase
utils.map('n', '<C-k-u>', '<ESC>viwUi')
utils.map('n', '<C-k-u>', 'viwUi<ESC>')
utils.map('v', '<C-k-u>', '<ESC>viwUi')
utils.map('v', '<C-k-u>', 'viwUi<ESC>')

-- Set lowercase
utils.map('n', '<C-k>l', '<ESC>viwu')
utils.map('n', '<C-k>l', 'viwu<ESC>')
utils.map('v', '<C-k>l', '<ESC>viwu')
utils.map('v', '<C-k>l', 'viwu<ESC>')

utils.map('n', '<C-h>', '<ESC>:%s/')


utils.map('n', '<C-o>', ':Telescope find_files<CR>')
utils.map('n', '<Leader>v', ':vsplit<CR>')
utils.map('n', '<Leader>h', ':sv<CR>')
