local harpoon = require("harpoon")

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

    require("kvim.keymappings").load({
        normal_mode = {
            ["tl"] = function()
                harpoon:list():next()
            end,
            ["th"] = function()
                harpoon:list():prev()
            end,
            ["ta"] = function()
                harpoon:list():append()
            end,
            ["tt"] = function()
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
            end,
            ["tp"] = function()
                toggle_telescope(harpoon:list())
            end,
        },
    })
end

return M
