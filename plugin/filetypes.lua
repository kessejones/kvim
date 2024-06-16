vim.filetype.add({
    extension = {
        mysql = function()
            return "sql"
        end,
    },
    pattern = {
        [".*%.hurl.*"] = "hurl",
    },
})
