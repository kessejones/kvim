-- return {
--     "kristijanhusak/vim-dadbod-ui",
--     cmd = "DBUIToggle",
--     keys = {
--         {
--             "<Leader>u",
--             ":DBUIToggle<CR>",
--             desc = "Toggle Dadbod UI",
--         },
--     },
--     dependencies = {
--         "tpope/vim-dadbod",
--         "kristijanhusak/vim-dadbod-completion",
--     },
-- }

return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            drawer = {
                disable_help = true,
            },
            editor = {
                mappings = {
                    { key = "<Leader>n", mode = "v", action = "run_selection" },
                    { key = "<Leader>n", mode = "n", action = "run_file" },
                },
            },
        })

        require("kvim.keymappings").load({
            normal_mode = {
                ["<leader>u"] = function()
                    require("dbee").toggle()
                end,
                ["<leader>"] = function()
                    require("dbee").open()
                end,
            },
        })
    end,
}
