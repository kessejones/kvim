local telescope = require("telescope")
local builtin = require("telescope.builtin")
local custom = require("kvim.core.telescope.custom")
local actions = require("telescope.actions")
local keymappings = require("kvim.keymappings")

local M = {}

local paste_from_register = function(bufnr)
    local content = vim.fn.getreg("+", 1)
    if vim.api.nvim_buf_get_option(bufnr, "modifiable") then
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
                "^Build/",
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

    keymappings.load({
        normal_mode = {
            ["<C-p>"] = custom.find_files,
            ["<Leader>p"] = builtin.find_files,
            ["<Leader>fl"] = builtin.live_grep,
            ["<Leader>fb"] = builtin.buffers,
            ["<Leader>fr"] = custom.lsp_references,
            ["<Leader>fs"] = builtin.git_stash,
            ["<Leader>fg"] = builtin.git_commits,
            ["<Leader>fn"] = builtin.git_branches,
            ["<Leader>fc"] = custom.curr_buf,
            ["<Leader>fp"] = builtin.commands,
            ["gI"] = custom.lsp_implementations,
            ["gr"] = custom.lsp_references,
            ["gu"] = custom.diagnostics,
            ["<Leader>z"] = builtin.resume,
        },
    })
end

return M
