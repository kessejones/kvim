local M = {}

function M.init()
    local blink = require("blink.cmp")

    blink.setup({
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },

            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    opts = {
                        max_completions = 3,
                        max_attempts = 4,
                    },
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },

        keymap = {
            preset = "none",

            ["<CR>"] = { "accept", "fallback" },
            ["<C-c>"] = { "cancel", "fallback" },
            ["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
            ["<C-k>"] = { "select_prev", "snippet_backward", "fallback" },
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            ["<C-y>"] = { "show", "select_and_accept", "fallback" },
            ["<C-l>"] = { "show_signature", "hide_signature", "fallback" },
        },

        cmdline = {
            enabled = true,
            completion = {
                menu = { auto_show = true },
            },
            keymap = {
                ["<C-c>"] = { "cancel", "fallback" },
                ["<ESC>"] = { "cancel", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-y>"] = { "show", "select_and_accept", "fallback" },
            },
        },

        snippets = { preset = "luasnip" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
            frecency = {
                enabled = true,
            },
            use_proximity = true,

            sorts = {
                "exact",
                -- defaults
                "score",
                "sort_text",
            },
        },
        completion = {
            accept = { auto_brackets = { enabled = false } },
            ghost_text = {
                enabled = true,
            },
            list = {
                selection = {
                    auto_insert = false,
                    preselect = false,
                },
            },
            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
            },
            documentation = {
                window = { border = "rounded" },
                auto_show = true,
                auto_show_delay_ms = 0,
            },
        },
    })
end

return M
