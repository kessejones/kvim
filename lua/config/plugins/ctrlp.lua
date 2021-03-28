local utils = require('utils')

vim.g.ctrlp_working_path_mode = 'ra'
vim.g.ctrlp_by_filename = false
vim.g.ctrlp_regexp = true

vim.g.ctrlp_tabpage_position = 'ac'
vim.g.ctrlp_open_new_file = 't'
vim.g.ctrlp_multiple_files = 't'

utils.map('n', '<C-p>', ':CtrlPCommandPalette<CR>')
