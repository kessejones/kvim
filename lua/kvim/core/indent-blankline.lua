local indent_blankline = require("indent_blankline")

local M = {}

function M.init()
    indent_blankline.setup({
        show_current_context = true,
        show_current_context_start = true,
        bufname_exclude = { "terminal", "startfy" },
        buftype_exclude = { "help", "startfy", "dashboard", "packer", "fugitive" },
        filetype_exclude = { "NvimTree", "floaterm", "packer", "Term", "term" },
    })
end

return M
