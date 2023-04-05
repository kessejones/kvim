local M = {}
local cmp = require("cmp")
local lspkind = require("lspkind")

function M.init()
    local select_prev_item = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { "i", "s", "c" })

    local select_next_item = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, { "i", "s", "c" })

    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lsp_signature_help" },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<Tab>"] = select_next_item,
            ["<C-j>"] = select_next_item,
            ["<S-Tab>"] = select_prev_item,
            ["<C-k>"] = select_prev_item,
            ["<C-f>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
            }),
            ["<c-y>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
        },
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]",
                },
            }),
        },
        experimental = {
            native_menu = false,
            ghost_text = true,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })

    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
        formatting = {
            format = lspkind.cmp_format({
                with_text = false,
                menu = {
                    cmdline = "[cmd]",
                    path = "[path]",
                },
            }),
        },
    })

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M
