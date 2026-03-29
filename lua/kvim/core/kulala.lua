local kulala = require("kulala")

kulala.setup({
    default_view = "headers_body",
    ui = {
        max_response_size = 65536,
    },
})

vim.api.nvim_create_augroup("Kulala", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "http" },
    group = "Kulala",
    callback = function(args)
        vim.keymap.set("n", "<Leader>n", kulala.run, { desc = "Run this Hurl file", buffer = args.buf })
    end,
})

local bufnr = vim.api.nvim_get_current_buf()
-- NOTE: workaround because kulala is loaded on filetype http
if vim.bo[bufnr].filetype == "http" then
    vim.keymap.set("n", "<Leader>n", kulala.run, { desc = "Run this Hurl file", buffer = bufnr })
end
