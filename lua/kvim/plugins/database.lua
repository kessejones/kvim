return {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUIToggle",
    keys = {
        {
            "<Leader>u",
            ":DBUIToggle<CR>",
            desc = "Toggle Dadbod UI",
        },
    },
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
}
