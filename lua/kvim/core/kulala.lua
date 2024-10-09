local nmap = require("kvim.utils.keymap").nmap

local kulala = require("kulala")

local M = {}

function M.init()
    kulala.setup({
        default_view = "headers_body",
    })

    vim.api.nvim_create_augroup("Kulala", { clear = true })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.http" },
        group = "Kulala",
        callback = function(args)
            nmap("<Leader>n", kulala.run, { desc = "Run this Hurl file", buffer = args.buf })
        end,
    })
end

return M
