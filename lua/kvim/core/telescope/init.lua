local telescope = require("telescope")
local custom = require("kvim.core.telescope.custom")
local actions = require("telescope.actions")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                "^.git/",
                "^vendor/",
                "^node_modules/",
                "^target/",
                "^coverage/",
                "^code_coverage_html/",
                "^.phpunit.cache/",
                "^test/reports/",
                "^build/",
                "^Build/",
                ".DS_Store",
            },
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-h>"] = actions.file_split,
                    ["<C-v>"] = actions.file_vsplit,
                    ["<C-c>"] = actions.close,
                    ["<ESC>"] = actions.close,
                },
                n = {
                    ["<C-c>"] = actions.close,
                    ["<ESC>"] = actions.close,
                },
            },
            layout_config = {
                width = 0.95,
                height = 0.85,
                prompt_position = "top",
                horizontal = {
                    preview_width = function(_, cols, _)
                        if cols > 200 then
                            return math.floor(cols * 0.4)
                        else
                            return math.floor(cols * 0.6)
                        end
                    end,
                },
                vertical = {
                    width = 0.9,
                    height = 0.95,
                    preview_height = 0.5,
                },
                flex = {
                    horizontal = {
                        preview_width = 0.9,
                    },
                },
            },
            sorting_strategy = "ascending",
            scroll_strategy = "cycle",
            color_devicons = true,
            layout_strategy = "horizontal",
            selection_caret = " ",
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = true,
                find_command = { "rg", "--files" },
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<C-p>"] = custom.find_files,
            ["<Leader>p"] = ":Telescope find_files<CR>",
            ["<Leader>fl"] = ":Telescope live_grep<CR>",
            ["<Leader>fb"] = ":Telescope buffers<CR>",
            ["<Leader>fr"] = custom.lsp_references,
            ["<Leader>fs"] = ":Telescope git_stash<CR>",
            ["<Leader>fg"] = ":Telescope git_commits<CR>",
            ["<Leader>fc"] = custom.curr_buf,
            ["<Leader>fa"] = custom.code_actions,
            ["<Leader>fp"] = ":Telescope commands<CR>",
        },
        visual_mode = {
            ["<Leader>fa"] = custom.code_actions,
        },
    })
end

return M
