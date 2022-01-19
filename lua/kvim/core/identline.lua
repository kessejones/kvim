local M = {  }

function M:init()
    vim.g.indentLine_char = '▏'
    vim.g.indentLine_fileTypeExclude = {'help', 'startfy', 'dashboard', 'packer'}
    vim.g.indentLine_bufNameExclude = {'terminal', 'startfy'}
    vim.g.indentLine_setConceal = 0
end

return M

