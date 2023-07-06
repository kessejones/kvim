return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.ai").setup({
            mappings = {
                goto_left = "[f",
                goto_right = "]f",
            },
            silent = true,
        })

        require("mini.splitjoin").setup()
        require("mini.surround").setup()
    end,
}
