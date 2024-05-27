local telescope = require("telescope")
local builtin = require("telescope.builtin")
local custom = require("kvim.core.telescope.custom")
local actions = require("telescope.actions")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

local paste_from_register = function(bufnr)
    local content = vim.fn.getreg("+", 1)
    if vim.api.nvim_get_option_value("modifiable", { buf = bufnr }) then
        if type(content) == "table" then
            content = table.concat(content, "\n")
        end
        vim.api.nvim_paste(content, true, -1)
    end
end

function M.init()
    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                "^%Toolchain/",
                "^%.git/",
                "^%.idea/",
                "^vendor/",
                "^node_modules/",
                "^target/",
                "^coverage/",
                "^code_coverage_html/",
                "^%.phpunit%.cache/",
                "^test/reports/",
                "^_build/",
                "^build/",
                "^deps/",
                "^Build/",
                "^%.elixir_ls/",
                "%.DS_Store",
                "%.o$",
                "%.so$",
                "%.mp4$",
                "%.jpg$",
                "%.jpeg$",
                "%.png$",
                "%.webp$",
                "%.db$",
            },
            mappings = {
                i = {
                    ["<Tab>"] = paste_from_register,
                    ["<C-i>"] = paste_from_register,
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-e>"] = actions.select_tab,
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
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
            fzf = {
                fuzzy = false,
            },
        },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")

    nmap("<C-p>", custom.find_files, { desc = "Find files" })
    nmap("<Leader>p", custom.find_files, { desc = "Find files with preview" })
    nmap("<Leader>fl", builtin.live_grep, { desc = "Live grep" })
    nmap("<Leader>fb", builtin.buffers, { desc = "Find Buffers" })
    nmap("<Leader>fr", custom.lsp_references, { desc = "Find references (LSP)" })
    nmap("<Leader>fd", builtin.diagnostics, { desc = "Find references (LSP)" })
    nmap("<Leader>f/", custom.curr_buf, { desc = "Find in current buffer" })
    nmap("<Leader>fp", builtin.commands, { desc = "Find Command" })
    nmap("gI", custom.lsp_implementations, { desc = "Find implementations" })
    nmap("gr", custom.lsp_implementations, { desc = "Find references" })
    nmap("gu", custom.lsp_implementations, { desc = "Find diagnostics" })
    nmap("<Leader>z", builtin.resume, { desc = "Resume telescope prompt" })
end

return M
