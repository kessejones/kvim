local utils = require('utils')

vim.g['airline#extensions#tabline#enabled'] = true
vim.g['airline#extensions#tabline#left_sep'] = ''
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#tabline#right_sep'] = ''
vim.g['airline#extensions#tabline#right_alt_sep'] = ''

vim.g.airline_powerline_fonts = true
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''

vim.g.airline_theme = 'tokyonight'
--  vim.g['airline#extensions#branch#enabled'] = true

utils.opt('g', 'showtabline', 2)
utils.opt('o', 'noshowmode', true)
-- vim.cmd 'set noshowmode'
