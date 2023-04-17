local cmp = require("cmp")
local lspkind = require("lspkind")

local M = {}

function M.init()
    local select_prev_item = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_prev_item()
        else
            cmp.complete()
        end
    end, { "i", "s", "c" })

    local select_next_item = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_next_item()
        else
            cmp.complete()
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
            ["<S-Tab>"] = select_prev_item,
            ["<C-p>"] = select_prev_item,
            ["<C-n>"] = select_next_item,
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
            }),
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                menu = {
                    buffer = "[Buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[API]",
                    path = "[Path]",
                    luasnip = "[Snip]",
                },
            }),
        },
        experimental = {
            ghost_text = true,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
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
                mode = "symbol",
                menu = {
                    path = "[Path]",
                    cmdline = "[CMD]",
                },
            }),
        },
    })

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return M
