local mason = require("mason")

vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

mason.setup({
    ui = {
        border = "rounded",
    },
})
