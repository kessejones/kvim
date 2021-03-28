local gl = require('galaxyline')

local sections = gl.section
local condition = require('galaxyline.condition')

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

sections.left[1] = {
    ViMode = {
        provider = function()
            return ' '
        end,
        hightlight = {'#FF0000', '#00FF00'}
    }
}

sections.left[2] = {
    GitIcon = {
        provider = function()
            return ''
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', '#0000FF'},
        highlight = {'#FF00FF', '#00FFFF'}
    }
}

sections.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'None', '#00FFFF'},
        highlight = {'#00FFFF', '#FFFFFF'}
    }
}

sections.right[5] = {
    FileType = {
        provider = function()
            return vim.bo.filetype:upper()
        end,
        separator = ' '
    }
}

sections.right[6] = {
    LineInfo = {
        provider = function()
            local current_line = vim.fn.line('.')
            local total_lines = vim.fn.line('$')
            local current_column = vim.fn.col('.')

            return ' '..current_line.. '-'..total_lines..':'..current_column
        end,
        separator = ' ',
        separator_highlight = { 'NONE', '#00FFFF' },
        highlight = { '#FF0000', '#00FFFF' }
    }
}
