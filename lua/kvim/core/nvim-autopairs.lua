local autopairs = require("nvim-autopairs")

local M = {}

function M.init()
    autopairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
        fast_wrap = {
            map = "<C-e>",
            chars = { "{", "[", "(", '"', "'" },
            end_key = "L",
            check_comma = true,
            pattern = [=[[%'%"%>%]%)%}%,]]=],
            before_key = "h",
            after_key = "l",
            cursor_pos_before = true,
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            manual_position = true,
            highlight = "Search",
            highlight_grey = "Comment",
        },
    })
end

return M
