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

    nmap("<leader>rN", function()
        snacks.rename.rename_file()
    end, { desc = "Rename File" })
end

return M
