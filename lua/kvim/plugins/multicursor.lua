return {
    "mg979/vim-visual-multi",
    keys = {
        "\\j",
        "\\k",
        "<C-n>",
    },
    init = function()
        require("kvim.core.multi-cursor").init()
    end,
}
