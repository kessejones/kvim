local utils = require('utils')

utils.map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

-- Open new empty tab
utils.map('n', '<C-t>', ':tabnew<CR>')

utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

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
utils.map('n', '<S-d>', '<ESC>yyp')
-- utils.map('v', '<S-d>', '<ESC>yp')

-- Set uppercase
utils.map('n', '<S-u>', '<ESC>viwUi')
utils.map('n', '<S-u>', 'viwUi<ESC>')
-- utils.map('v', '<S-u>', '<ESC>viwUi')
-- utils.map('v', '<S-u>', 'viwUi<ESC>')

-- Set lowercase
utils.map('n', '<S-l>', '<ESC>viwu')
utils.map('n', '<S-l>', 'viwu<ESC>')
-- utils.map('v', '<S-l>', '<ESC>viwu')
-- utils.map('v', '<S-l>', 'viwu<ESC>')

utils.map('n', '<C-h>', '<ESC>:%s/')

utils.map('n', '<Leader>v', ':vsplit<CR>')
utils.map('n', '<Leader>h', ':sv<CR>')

utils.map('n', '<ESC>', ':noh<CR>')
