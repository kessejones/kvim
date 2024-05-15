local harpoon = require("harpoon")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

function M.init()
    harpoon.setup({
        settings = {
            save_on_toggle = true,
        },
    })

    nmap("tl", function()
        harpoon:list():next()
    end, { desc = "Next file in harpoon" })

    nmap("th", function()
        harpoon:list():prev()
    end, { desc = "Previous file in harpoon" })

    nmap("ta", function()
        harpoon:list():append()
    end, { desc = "Add current buffer file to harpoon list" })

    nmap("tt", function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), {
            title_pos = "center",
            ui_width_ratio = 0.3,
            border = {
                "╭",
                "─",
                "╮",
                "│",
                "╯",
                "─",
                "╰",
                "│",
            },
        })
    end, { desc = "Open harpoon list in quick menu" })

    nmap("tp", function()
        toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon list in Telescope" })
end

return M
