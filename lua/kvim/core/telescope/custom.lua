local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local M = {}

function M.curr_buf()
    local opts = themes.get_dropdown({
        layout_config = {
            height = 25,
            width = 120,
        },
        border = true,
        previewer = false,
        shorten_path = false,
    })
    builtin.current_buffer_fuzzy_find(opts)
end

function M.find_files()
    local opts = themes.get_dropdown({
        layout_config = {
            height = 25,
            width = 120,
        },
        previewer = false,
    })
    builtin.find_files(opts)
end

function M.lsp_references()
    local opts = themes.get_dropdown({
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
            height = 50,
            width = 170,
        },
        show_line = false,
        results_title = "LSP References",
    })
    builtin.lsp_references(opts)
end

function M.lsp_implementations()
    local opts = themes.get_dropdown({
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
            height = 50,
            width = 170,
        },
        previewer = true,
        results_title = "LSP Implementations",
    })
    builtin.lsp_implementations(opts)
end

function M.diagnostics()
    local opts = themes.get_dropdown({
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            height = 50,
            width = 170,
        },
        results_title = "Diagnostics",
    })
    builtin.diagnostics(opts)
end

return M
