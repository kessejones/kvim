local nmap = require("kvim.utils.keymap").nmap

local M = {}

local header = [[
██╗  ██╗  ██╗   ██╗██╗███╗   ███╗
██║ ██╔╝  ██║   ██║██║████╗ ████║
█████╔╝   ██║   ██║██║██╔████╔██║
██╔═██╗   ╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗   ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝    ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

function M.init()
    local snacks = require("snacks")

    snacks.setup({
        notifier = { enabled = true },
        indent = {
            enabled = true,
            indent = {
                enabled = true,
                hl = "KvimIdent",
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
            matcher = {
                fuzzy = false,
            },
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = "i" },
                        ["<C-e>"] = { "edit_tab", mode = "i" },

                        ["<S-C-U>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["<S-C-D>"] = { "preview_scroll_down", mode = { "i", "n" } },

                        ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        ["<C-g>"] = { "toggle_live", mode = { "i", "n" } },
                        ["<C-.>"] = { "toggle_hidden", mode = { "i", "n" } },
                    },
                },
            },
        },
        statuscolumn = {
            enabled = true,
            refresh = 50,
        },
        dashboard = {
            enabled = true,
            preset = {
                header = header,
                keys = {
                    -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    --      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        desc = "New Buffer",
                        key = "i",
                        action = ":ene",
                    },
                    {
                        icon = " ",
                        desc = "Open Current Folder",
                        key = "o",
                        action = "<Leader>tt",
                    },
                },
            },
            sections = {
                {
                    section = "header",
                    padding = 3,
                },
                {
                    icon = " ",
                    title = "Recents ",
                    file = vim.fn.fnamemodify(".", ":~"),
                },
                {
                    section = "recent_files",
                    cwd = true,
                    indent = 2,
                    padding = 2,
                },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
                { section = "keys", padding = 2 },
                { section = "startup" },
            },
        },
    })

    local finder_ignore = {
        ".zig-cache",
        "zig-cache",
    }

    nmap("<leader>rN", function()
        snacks.rename.rename_file()
    end, { desc = "Rename File" })

    nmap("<C-p>", function()
        snacks.picker.files({
            hidden = true,
            ignored = true,
            exclude = finder_ignore,
            frecency = true,
            on_show = function(picker)
                picker:toggle_preview(false)
            end,
            layout = {
                layout = {
                    box = "horizontal",
                    width = 0.5,
                    height = 0.5,
                    {
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                    },
                },
            },
        })
    end, { desc = "Picker" })

    nmap("<Leader>f/", function()
        snacks.picker.lines({
            layout = {
                layout = {
                    box = "horizontal",
                    width = 0.5,
                    height = 0.5,
                    {
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                    },
                },
            },
        })
    end)

    nmap("<Leader>fp", function()
        snacks.picker.files()
    end)

    nmap("<Leader>fl", function()
        snacks.picker.grep()
    end)

    nmap("<Leader>fb", function()
        snacks.picker.buffers()
    end)

    nmap("<Leader>fu", function()
        snacks.picker.undo()
    end)

    nmap("<Leader>ft", function()
        snacks.picker.lsp_type_definitions()
    end)

    nmap("<Leader>fs", function()
        snacks.picker.lsp_symbols()
    end)

    nmap("<Leader>fw", function()
        snacks.picker.grep_word()
    end)

    nmap("<Leader>fg", function()
        snacks.picker.git_log_file()
    end)

    nmap("<Leader>fe", function()
        snacks.picker.explorer({
            finder = "explorer",
            sort = { fields = { "sort" } },
            tree = true,
            supports_live = true,
            follow_file = true,
            focus = "input",
            auto_close = false,
            jump = { close = false },
            layout = {
                preview = false,
                layout = {
                    width = 0.5,
                    height = 0.5,
                    box = "vertical",
                    border = "rounded",
                    {
                        win = "input",
                        height = 1,
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                    },
                    {
                        win = "list",
                        border = "none",
                    },
                },
            },
        })
    end)
end

return M
