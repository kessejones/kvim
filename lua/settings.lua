local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'au! TabClosed * :tablast'

utils.opt('g', 'showtabline', 2)
utils.opt('g', 'mouse', 'a')
utils.opt('g', 'autoindent', true)
utils.opt('g', 'background', 'dark')
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('w', 'number', true)
utils.opt('w', 'wrap', true)
utils.opt('w', 'cursorline', true)

utils.opt('o', 'inccommand', 'split')

