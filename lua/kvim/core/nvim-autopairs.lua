local autopairs = require("nvim-autopairs")

local M = {}

function M.init()
    autopairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
        fast_wrap = {
            map = "<C-e>",
            chars = { "{", "[", "(", '"', "'" },
            end_key = "$",
            check_comma = true,
        },
    })
end

return M
