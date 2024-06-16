local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.init()
    treesitter.setup({
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "rust",
            "php",
            "typescript",
            "javascript",
            "tsx",
            "http",
            "hurl",
            "html",
            "css",
            "markdown",
            "fish",
            "dockerfile",
            "json",
            "yaml",
            "go",
            "sql",
        },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        textobjects = {
            selection = true,
            lookahead = true,
            swap = {
                enable = true,
                swap_next = {
                    [",a"] = "@parameter.inner",
                },
                swap_previous = {
                    [",A"] = "@parameter.inner",
                },
            },

            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]l"] = "@loop.*",
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]L"] = "@loop.*",
                    ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[l"] = "@loop.*",
                    ["[s"] = { query = "@scope", query_group = "locals", desc = "Prev scope" },
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                },

                goto_next = {
                    ["]d"] = "@conditional.outer",
                },
                goto_previous = {
                    ["[d"] = "@conditional.outer",
                },
            },

            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                },

                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "<C-v>",
                },
            },

            include_surrounding_whitespace = true,
        },
    })
end

return M
