vim.filetype.add({
    extension = {
        mysql = function()
            return "sql"
        end,
        http = function()
            return "http"
        end,
    },
    pattern = {
        [".*%.hurl.*"] = "hurl",
    },
})
