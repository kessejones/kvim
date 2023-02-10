return {
    "stevearc/oil.nvim",
    keys = {
        {
            "<Leader>t",
            function()
                require("oil").open()
            end,
            desc = "Open oil",
        },
    },
    config = function()
        require("oil").setup({
            columns = {
                "icon",
            },
            keymaps = {
                ["<BS>"] = "actions.parent",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-l>"] = "actions.refresh",
                ["<CR>"] = "actions.select",
                ["g."] = "actions.toggle_hidden",
                ["<Leader>t"] = "actions.close",
                ["<Leader>ss"] = {
                    callback = function()
                        require("oil").save({
                            confirm = false,
                        })
                    end,
                },
            },
            skip_config_for_simple_edits = true,
        })
    end,
}
