local keymappings = require("kvim.keymappings")
local M = {}

function M.init()
    -- NOTE: \x1f is equal to ctrl+\ (hack for macos)
    local ctrl_bslash = "\x1f"

    keymappings.load({
        normal_mode = {
            [ctrl_bslash] = '<cmd>:FloatermToggle<CR>',
        },
        terminal_mode = {
            ["<C-i>"] = "<C-\\><C-n>:FloatermNew<CR>",
            ["<C-k>"] = "<C-\\><C-n>:FloatermKill<CR>",
            ["<C-p>"] = "<C-\\><C-n>:FloatermPrev<CR>",
            ["<C-n>"] = "<C-\\><C-n>:FloatermNext<CR>",
            [ctrl_bslash] = "<C-\\><C-n>:FloatermHide<CR>",
        },
    })

    vim.g.floaterm_title = "Terminal ($1/$2)"
    vim.g.floaterm_width = 0.99
    vim.g.floaterm_height = 0.99
    vim.g.floaterm_keymap_toggle = "<C-\\>"
end

return M
