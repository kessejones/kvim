return {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUIToggle",
    keys = {
        "<Leader>uu",
    },
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
        require("kvim.core.vim-dadbod").init()
    end,
}
