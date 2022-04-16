local telescope = require("telescope")
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
            ["<C-p>"] = M.find_files,
            ["<Leader>p"] = ":Telescope find_files<CR>",
            ["<Leader>fl"] = ":Telescope live_grep<CR>",
            ["<Leader>fb"] = ":Telescope buffers<CR>",
            ["<Leader>fr"] = ":Telescope lsp_references<CR>",
            ["<Leader>fs"] = ":Telescope git_stash<CR>",
            ["<Leader>fg"] = ":Telescope git_commits<CR>",
            ["<Leader>fc"] = M.curr_buf,
            ["<Leader>fa"] = M.code_actions,
        },
        visual_mode = {
            ["<Leader>fa"] = M.code_actions,
        },
    })
end

function M.curr_buf()
    local opts = require("telescope.themes").get_dropdown({
        height = 10,
        previewer = false,
    })
    require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.find_files()
    local opts = require("telescope.themes").get_dropdown({
        layout_config = {
            height = 25,
            width = 120,
        },
        previewer = false,
    })
    require("telescope.builtin").find_files(opts)
end

function M.code_actions()
    local opts = require("telescope.themes").get_dropdown({
        height = 10,
    })
    require("telescope.builtin").lsp_code_actions(opts)
end

return M
