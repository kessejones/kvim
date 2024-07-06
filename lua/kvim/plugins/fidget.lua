return {
    "j-hui/fidget.nvim",
    config = function()
        vim.notify = require("fidget").notify
    end,
}
