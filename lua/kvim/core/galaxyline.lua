local gl = require('galaxyline')

local M = {  }

function M:init()
    local sections = gl.section
    local condition = require('galaxyline.condition')

    gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

    sections.left[1] = {
        ViMode = {
            provider = function()
                return ' '
            end,
            separator_highlight = { 'NONE', '#2a2b35' },
            hightlight = { '#000000', '#2a2b35' }
        }
    }

    sections.left[2] = {
        GitIcon = {
            provider = function()
                return ''
            end,
            condition = condition.check_git_workspace,
            separator = ' ',
            separator_highlight = { 'NONE', '#2a2b35' },
            highlight = { '#f7768e', '#2a2b35' }
        }
    }

    sections.left[3] = {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            separator = ' ',
            separator_highlight = { 'NONE', '#2a2b35' },
            highlight = { '#f7768e', '#2a2b35' }
        }
    }

    -- sections.left[4] = {
    --     Empty = {
    --         provider = function()
    --             return ' '
    --         end,
    --         highlight_separator = { 'NONE', '#1a1b26' }
    --     }
    -- }

    sections.right[5] = {
        FileType = {
            provider = function()
                return ' '..vim.bo.filetype:upper()..' '
            end,
            separator = ' ',
            highlight_separator = { 'NONE', '#2a2b35' },
            highlight = { '#f7768e', '#2a2b35'}
        }
    }

    sections.right[6] = {
        LineInfo = {
            provider = function()
                local current_line = vim.fn.line('.')
                local total_lines = vim.fn.line('$')
                local current_column = vim.fn.col('.')
                local total_columns = vim.fn.col('$')

                return ' '..current_line..'-'..total_lines..':'..current_column..'-'..total_columns
            end,
            separator = ' ',
            separator_highlight = { 'NONE', '#1a1b26' },
            highlight = { '#f7768e', '#2a2b35' }
        }
    }

    sections.right[7] = {
        Endbar = {
            provider = function()
                return ' '
            end,
            separator_highlight = { 'NONE', '#2a2b35' },
            highlight = { '#f7768e', '#2a2b35' }
        }
    }
end

return M

