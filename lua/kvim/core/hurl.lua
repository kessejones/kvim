local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap

local M = {}

function M.init()
    require("hurl").setup({
        env_file = {
            "hurl.env",
            ".env",
        },
        verbose = false,
        debug = false,
        split_position = "left",
        auto_close = false,
        show_notification = true,
        mappings = {
            close = "q",
        },
    })

    vim.api.nvim_create_augroup("Hurl", { clear = true })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.hurl" },
        group = "Hurl",
        callback = function(args)
            nmap("<Leader>n", "<CMD>HurlRunner<CR>", { desc = "Run this Hurl file", buffer = args.buf })
            vmap("<Leader>n", "<CMD>HurlRunnerAt<CR>", { desc = "Run current Hurl selection", buffer = args.buf })
        end,
    })
end

return M
