return {
    "mg979/vim-visual-multi",
    keys = {
        "\\j",
        "\\k",
    },
    init = function()
        require("kvim.core.multi-cursor").init()
    end,
}
