return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    keys = {
        {
            "<Leader>.e",
            ":Copilot enable<CR>",
        },
        {
            "<Leader>.d",
            ":Copilot disable<CR>",
        },
    },
    config = function()
        require("copilot").setup({
            panel = { enabled = false },
            suggestion = { enabled = false },
        })
    end,
}
