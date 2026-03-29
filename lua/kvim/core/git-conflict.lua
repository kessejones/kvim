local M = {}

function M.init()
    require("git-conflict").setup()

    require("kvim.utils.keymap").load({
        normal_mode = {
            ["<Leader>gq"] = ":GitConflictListQf<CR>",
        },
    })
end

return M
