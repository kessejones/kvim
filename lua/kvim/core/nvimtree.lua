local nvim_tree = require("nvim-tree")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    nvim_tree.setup({
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        view = {
            mappings = {
                list = {
                    {
                        key = ".",
                        action = "root_dir",
                        action_cb = function(node)
                            if not node.absolute_path or node.absolute_path == "" then
                                return
                            end
                            local absolute_path = vim.fn.fnamemodify(node.absolute_path, ":p:h")
                            nvim_tree.change_dir(absolute_path)
                        end,
                    },
                },
            },
        },
        filters = {
            custom = {},
        },
    })

    keymappings.load({
        normal_mode = {
            ["<C-g>"] = nvim_tree.toggle,
        },
    })
end

return M
