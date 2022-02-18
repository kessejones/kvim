local telescope = require("telescope")
local actions = require("telescope.actions")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-c>"] = actions.close,
                },
                n = {
                    ["<C-c>"] = actions.close,
                },
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<C-p>"] = ":lua require('kvim.core.telescope').find_files()<CR>",
            ["<Leader>p"] = ":lua require('telescope.builtin').find_files()<CR>",
            ["<Leader>fg"] = ":Telescope live_grep<CR>",
            ["<Leader>fb"] = ":Telescope buffers<CR>",
            ["<Leader>fr"] = ":Telescope lsp_references<CR>",
            ["<Leader>fc"] = ":lua require('kvim.core.telescope').curr_buf()<CR>",
        },
    })
end

function M.curr_buf()
    local opts = require('telescope.themes').get_dropdown({
        height = 10,
        previewer = false
    })
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.find_files()
    local opts = require('telescope.themes').get_dropdown({
        height = 10,
        previewer = false,
    })
    require('telescope.builtin').find_files(opts)
end

return M
