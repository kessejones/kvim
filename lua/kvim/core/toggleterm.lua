local toggleterm = require("toggleterm")
local keymappings = require("kvim.keymappings")

local M = {}

function _G.set_terminal_keymaps()
    keymappings.load({
        terminal_mode = {
            ["<esc>"] = [[<C-\><C-n>]],
            ["[bs"] = '<cmd>:ToggleTerm<CR>', -- NOTE: [bs is equal to ctrl+\ (hack for macos)
        },
    })
end

function M.init()
    keymappings.load({
        normal_mode = {
            ["[bs"] = '<cmd>:ToggleTerm<CR>', -- NOTE: [bs is equal to ctrl+\ (hack for macos)
        },
    })

    toggleterm.setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
