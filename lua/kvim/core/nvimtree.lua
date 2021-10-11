local M = {}

local keymappings = require('kvim.keymappings')

function M:init()
    local settings = {
        active = true,
        on_config_done = nil,
        setup = {
            open_on_setup = false,
            auto_close = true,
            open_on_tab = false,
            update_focused_file = {
                enable = true
            }, 
            diagnostics = {
                enable = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                }
            },
            view = {
                width = 30,
                side = "left",
                auto_resize = false,
                mappings = {
                    custom_only = false,
                }
            },
            show_icons = {
                git = 1,
                folders = 1,
                files = 1,
                folders_arrow = 1,
                tree_width = 30,
            },
            ignore = {
                ".git", "node_nodules", "vendor", ".cache"
            },
            quit_on_open = 0,
            hide_dotfiles = 1,
            git_hl = 1,
            root_folder_modifier = ":t",
            auto_resize = 1,
            auto_ignore_ft = { "startify", "dashboard" },
            icons = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    deleted = "",
                    untracked = "",
                    ignore = "",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = ""
                }
            }
        }
    }

    require'nvim-tree'.setup(settings)

    local default_mappings = {
        normal_mode = {
            ["<C-b>"] = ":NvimTreeToggle<CR>"
        }
    }

    keymappings:load(default_mappings)
end

return M
