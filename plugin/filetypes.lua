vim.filetype.add({
    extension = {
        mysql = function()
            return "sql"
        end,
    },
})
