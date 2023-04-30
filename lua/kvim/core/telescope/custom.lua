local entry_display = require("telescope.pickers.entry_display")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local utils = require("telescope.utils")

local M = {}

local function lsp_references_display(opts)
    opts = opts or {}

    local displayer = entry_display.create({
        separator = "",
        items = {
            { width = 8 },
            { remaining = true },
        },
    })

    local make_display = function(entry)
        local filename = utils.transform_path(opts, entry.filename)

        local line_info = { table.concat({ entry.lnum, entry.col }, ":"), "TelescopeResultsLineNr" }

        return displayer({
            line_info,
            filename,
        })
    end

    return function(entry)
        local filename = entry.filename or vim.api.nvim_buf_get_name(entry.bufnr)
        local ordinal = string.format("%d:%d %s", entry.lnum, entry.col, filename)

        return {
            valid = true,
            value = entry,
            ordinal = ordinal,
            display = make_display,
            bufnr = entry.bufnr,
            filename = filename,
            lnum = entry.lnum,
            col = entry.col,
            start = entry.start,
            finish = entry.finish,
        }
    end
end

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
    local opts = {
        sorting_strategy = "ascending",
        entry_maker = lsp_references_display(),
    }
    builtin.lsp_references(opts)
end

function M.lsp_implementations()
    local opts = {
        layout_config = {
            height = 25,
            width = 120,
        },
        previewer = false,
    }
    builtin.lsp_implementations(opts)
end

return M
