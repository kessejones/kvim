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
            ["<Leader>p"] = ":lua require'telescope.builtin'.find_files({ hidden = true })<CR>",
            ["<Leader>fg"] = ":Telescope live_grep<CR>",
            ["<Leader>fb"] = ":Telescope buffers<CR>",
            ["<Leader>fr"] = ":Telescope lsp_references<CR>",
        },
    })
end

return M
