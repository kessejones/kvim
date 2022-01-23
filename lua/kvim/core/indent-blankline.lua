local M = {  }

function M:init()
    vim.g.indent_blankline_filetype_exclude = { 'help', 'startfy', 'dashboard', 'packer' }
    vim.g.indent_blankline_bufname_exclude = { 'terminal', 'startfy' }

    require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
    }
end

return M
