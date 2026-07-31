local snacks = require("snacks")

snacks.setup({
    notifier = { enabled = true },
    scope = { enabled = true },
    indent = {
        enabled = true,
        indent = {
            enabled = true,
            hl = "KvimIndent",
        },
        scope = {
            enabled = false,
            hl = "KvimScope",
        },
        chunk = {
            enabled = true,
            hl = "KvimChunk",
            char = {
                corner_top = "╭",
                corner_bottom = "╰",
                horizontal = "─",
                vertical = "│",
                arrow = ">",
            },
        },
        animate = {
            enabled = false,
        },
    },
    picker = {
        enabled = true,
        ui_select = true,
        matcher = {
            fuzzy = false,
            frecency = true,
            history_bonus = true,
        },
        layout = {
            layout = {
                backdrop = false,
                box = "vertical",
                width = 0.8,
                height = 0.8,
                border = false,
                {
                    win = "input",
                    height = 1,
                    border = "rounded",
                    title = "{title} {live} {flags}",
                },
                {
                    box = "horizontal",
                    { win = "list", border = "rounded" },
                    { win = "preview", border = "rounded" },
                },
            },
        },
        win = {
            input = {
                keys = {
                    ["<Esc>"] = { "close", mode = { "i", "n" } },
                    ["<C-e>"] = { "tab", mode = { "n", "i" } },

                    ["<S-C-U>"] = { "preview_scroll_up", mode = { "i", "n" } },
                    ["<S-C-D>"] = { "preview_scroll_down", mode = { "i", "n" } },

                    ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                    ["<C-g>"] = { "toggle_live", mode = { "i", "n" } },
                    ["<C-.>"] = { "toggle_hidden", mode = { "i", "n" } },
                    ["<C-p>"] = { "toggle_preview", mode = { "i", "n" } },
                },
            },
        },
    },
    statuscolumn = {
        enabled = true,
        refresh = 50,
        left = { "sign" },
    },
    -- dashboard = require("kvim.core.snacks.dashboard"),
})

require("kvim.core.snacks.pickers")
