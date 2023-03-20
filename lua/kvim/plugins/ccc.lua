return {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccHighlighterToggle", "CccHighlighterEnable", "CccHighlighterDisable" },
    keys = {
        {
            "<Leader>c",
            ":CccPick<CR>",
            desc = "ColorPicker",
        },
    },
}
