local nvim_tree = require("nvim-tree")
local events = require("nvim-tree.events")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    nvim_tree.setup({
        on_attach = "default",
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = { "term" },
        },
        view = {
            float = {
                enable = true,
                open_win_config = {
                    height = 100,
                },
            },
            preserve_window_proportions = true,
        },
        filters = {
            custom = {},
        },
    })

    events.subscribe(events.Event.FileCreated, function(e)
        vim.cmd.edit(e.fname)
    end)

    keymappings.load({
        normal_mode = {
            ["<C-g>"] = require("nvim-tree.api").tree.toggle,
        },
    })
end

return M
