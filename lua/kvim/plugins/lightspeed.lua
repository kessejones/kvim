return {
    "ggandor/lightspeed.nvim",
    keys = {
        "r",
        "S",
        "f",
        "F",
    },
    config = function()
        vim.g.lightspeed_no_default_keymaps = false

        local keymaps = {
            { "n", "r", "<Plug>Lightspeed_s" },
            { "n", "S", "<Plug>Lightspeed_S" },
            { "x", "r", "<Plug>Lightspeed_s" },
            { "x", "S", "<Plug>Lightspeed_S" },
            { "o", "z", "<Plug>Lightspeed_s" },
            { "o", "Z", "<Plug>Lightspeed_S" },

            { "o", "x", "<Plug>Lightspeed_x" },
            { "o", "X", "<Plug>Lightspeed_X" },

            { "n", "f", "<Plug>Lightspeed_f" },
            { "n", "F", "<Plug>Lightspeed_F" },
            { "x", "f", "<Plug>Lightspeed_f" },
            { "x", "F", "<Plug>Lightspeed_F" },
            { "o", "f", "<Plug>Lightspeed_f" },
            { "o", "F", "<Plug>Lightspeed_F" },

            { "n", ";", "<Plug>Lightspeed_;_ft" },
            { "x", ";", "<Plug>Lightspeed_;_ft" },
            { "o", ";", "<Plug>Lightspeed_;_ft" },

            { "n", ",", "<Plug>Lightspeed_,_ft" },
            { "x", ",", "<Plug>Lightspeed_,_ft" },
            { "o", ",", "<Plug>Lightspeed_,_ft" },
        }

        for _, t in ipairs(keymaps) do
            local mode = t[1]
            local lhs = t[2]
            local rhs = t[3]
            if vim.fn.mapcheck(lhs, mode) == "" and vim.fn.hasmapto(rhs, mode) == 0 then
                require("kvim.keymappings").set_keymaps(mode, lhs, rhs)
            end
        end

        require("lightspeed").setup({})
    end,
}
