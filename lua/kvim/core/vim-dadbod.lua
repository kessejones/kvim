local keymappings = require("kvim.utils.keymap")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            ["<Leader>u"] = ":DBUIToggle<CR>",
        },
    })

    vim.g.db_ui_execute_on_save = false

    vim.api.nvim_create_augroup("DBUIGroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = "DBUIGroup",
        pattern = { "*.sql" },
        callback = function(args)
            keymappings.load({
                normal_mode = {
                    ["<Leader>n"] = "<Plug>(DBUI_ExecuteQuery)",
                },
                visual_mode = {
                    ["<Leader>n"] = "<Plug>(DBUI_ExecuteQuery)",
                },
            }, args.buf)
        end,
    })
end

return M
