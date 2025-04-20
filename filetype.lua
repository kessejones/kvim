vim.filetype.add({
    extension = {
        mysql = function()
            return "sql"
        end,
        http = function()
            return "http"
        end,
        kes = function()
            return "kes"
        end,
    },
    pattern = {
        [".*%.hurl.*"] = "hurl",
        [".*/%.config/ghostty/config"] = "ini",
    },
})
