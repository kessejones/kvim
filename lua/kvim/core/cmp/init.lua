local cmp = require("cmp")
local lspkind = require("lspkind")

local M = {}

function M.init()
    cmp.setup({
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lsp_signature_help" },
            { name = "dotenv", option = { load_shell = false } },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-u>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.mapping.scroll_docs(-4)
                end
            end, { "i" }),
            ["<C-d>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.mapping.scroll_docs(4)
                end
            end, { "i" }),
            ["<C-k>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                end
            end, { "i", "c", "s" }),
            ["<C-j>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item()
                end
            end, { "i", "c", "s" }),
            ["<CR>"] = cmp.mapping.confirm({
                select = false,
            }),
            ["<C-y>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.confirm({
                        select = true,
                    })
                else
                    cmp.complete()
                end
            end, { "i" }),
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
                    dotenv = "[Env]",
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

    local cmdline_keymappings = cmp.mapping.preset.cmdline({
        ["<C-p>"] = function() end,
        ["<C-n>"] = function() end,
    })

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmdline_keymappings,
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.filetype("oil", {
        mapping = cmdline_keymappings,
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.filetype("gitcommit", {
        mapping = cmdline_keymappings,
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmdline_keymappings,
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

    cmp.setup.filetype({ "sql", "mysql" }, {
        sources = {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
            { name = "luasnip" },
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol",
                menu = {
                    ["vim-dadbod-completion"] = "[Dadbod]",
                    buffer = "[Buf]",
                    luasnip = "[Snip]",
                },
            }),
        },
    })

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
    end)
end

return M
