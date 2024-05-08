local keymappings = require("kvim.utils.keymap")

local M = {}

function M.init()
    require("hurl").setup({
        env_file = {
            "hurl.env",
            ".env",
        },
        split_position = "left",
        auto_close = false,
        show_notification = true,
    })

    vim.api.nvim_create_augroup("Hurl", { clear = true })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.hurl" },
        group = "Hurl",
        callback = function(args)
            keymappings.load({
                normal_mode = {
                    ["<Leader>n"] = "<CMD>HurlRunner<CR>",
                },
                visual_mode = {
                    ["<Leader>n"] = "<CMD>HurlRunnerAt<CR>",
                },
            }, args.buf)
        end,
    })
end

return M
