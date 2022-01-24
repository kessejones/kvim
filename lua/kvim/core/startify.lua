local utils = require('utils')
local M = {  }

local kvim_header = {
    '██╗  ██╗  ██╗   ██╗██╗███╗   ███╗',
    '██║ ██╔╝  ██║   ██║██║████╗ ████║',
    '█████╔╝   ██║   ██║██║██╔████╔██║',
    '██╔═██╗   ╚██╗ ██╔╝██║██║╚██╔╝██║',
    '██║  ██╗   ╚████╔╝ ██║██║ ╚═╝ ██║',
    '╚═╝  ╚═╝    ╚═══╝  ╚═╝╚═╝     ╚═╝'
}

local kvim_footer = {"Kesse Jones"}

local kvim_lists = {
    {
        type = 'dir',
        header = {'  Projeto: '..vim.fn.getcwd() }
    },
    {
        type = 'files',
        header = {'  Arquivos Recentes'}
    }
}

function M:init()
   vim.g.startify_custom_header = utils.center(kvim_header)
   vim.g.startify_custom_footer = utils.center(kvim_footer)
   vim.g.startify_lists = kvim_lists
   vim.g.startify_enable_special = false
   vim.g.startify_session_dir = '~/.config/nvim/session'
   vim.g.startify_session_autoload = true
   vim.g.webdevicons_enable_startify = true
end

return M

