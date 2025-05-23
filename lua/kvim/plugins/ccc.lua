return {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccHighlighterToggle", "CccHighlighterEnable", "CccHighlighterDisable" },
    keys = {
        "<Leader>cc",
    },
    config = function()
        require("ccc").setup()
    end,
}
