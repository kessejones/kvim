local Comment = require("Comment")

local M = {}

function M.init()
    Comment.setup()

    local comment_ft = require("Comment.ft")
    comment_ft.set("http", { "# %s", "# %s" })
    comment_ft.set("mysql", { "-- %s", "-- %s" })
    comment_ft.set("asm", { "# %s", "# %s" })
    comment_ft.set("hurl", { "# %s", "# %s" })
end

return M
