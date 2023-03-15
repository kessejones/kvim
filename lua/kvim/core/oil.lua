local oil = require("oil")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
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

    keymappings.load({
        normal_mode = {
            ["<Leader>t"] = function()
                oil.open()
            end,
        },
    })
end

return M
