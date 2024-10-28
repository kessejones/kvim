return {
    "j-hui/fidget.nvim",
    config = function()
        local fidget = require("fidget")

        fidget.setup()

        vim.notify = fidget.notify
    end,
}
