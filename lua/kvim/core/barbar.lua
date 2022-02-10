local keymappings = require("kvim.keymappings")
local M = {}

function M:init()
    vim.g.bufferline = {
        animation = true,
        no_name_title = "Untitled",
        insert_at_end = true,
    }

    keymappings:load({
        normal_mode = {
            ["<Space>1"] = ":BufferGoto 1<CR>",
            ["<Space>2"] = ":BufferGoto 2<CR>",
            ["<Space>3"] = ":BufferGoto 3<CR>",
            ["<Space>4"] = ":BufferGoto 4<CR>",
            ["<Space>5"] = ":BufferGoto 5<CR>",
            ["<Space>6"] = ":BufferGoto 6<CR>",
            ["<Space>7"] = ":BufferGoto 7<CR>",
            ["<Space>8"] = ":BufferGoto 8<CR>",
            ["<Space>9"] = ":BufferGoto 9<CR>",
            ["<Space>0"] = ":BufferLast<CR>",
        },
    })
end

return M
