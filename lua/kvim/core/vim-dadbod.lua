local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap

local M = {}

function M.init()
    nmap("<Leader>t", ":DBUIToggle<CR>", { desc = "Toggle database UI" })

    vim.g.db_ui_execute_on_save = false

    vim.api.nvim_create_augroup("DBUIGroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = "DBUIGroup",
        pattern = { "*.sql" },
        callback = function(args)
            nmap("<Leader>n", "<Plug>(DBUI_ExecuteQuery)", { buffer = args.buf, desc = "Run database query" })
            vmap("<Leader>n", "<Plug>(DBUI_ExecuteQuery)", { buffer = args.buf, desc = "Run selection database query" })
        end,
    })
end

return M
