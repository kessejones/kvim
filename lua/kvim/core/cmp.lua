local cmp = require("cmp")
local lspkind = require("lspkind")

local M = {}

function M.init()
    cmp.setup({
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lsp_signature_help" },
            { name = "dotenv", option = { load_shell = false } },
            { name = "dynamic" },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<S-Tab>"] = cmp.mapping(function(callback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    callback()
                end
            end, { "i" }),
            ["<Tab>"] = cmp.mapping(function(callback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    callback()
                end
            end, { "i" }),
            ["<C-k>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete()
                end
            end, { "i", "c", "s" }),
            ["<C-j>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete()
                end
            end, { "i", "c", "s" }),
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
                    dotenv = "[Env]",
                    dynamic = "[Dynamic]",
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

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
    end)

    require("cmp_dynamic").register({
        {
            label = "today",
            documentation = function()
                return {
                    kind = "markdown",
                    value = "Insert the date: " .. os.date("%Y-%m-%d"),
                }
            end,
            insertText = function()
                return os.date("%Y-%m-%d")
            end,
            kind = cmp.lsp.CompletionItemKind.Unit,
        },
        {
            label = "now",
            detail = "Only time",
            documentation = function()
                return {
                    kind = "markdown",
                    value = "Insert time: " .. os.date("%H:%M:%S"),
                }
            end,
            kind = cmp.lsp.CompletionItemKind.Unit,
            insertText = function()
                return os.date("%H:%M:%S")
            end,
        },
        {
            label = "now",
            detail = "Date and time",
            documentation = function()
                return {
                    kind = "markdown",
                    value = "Insert datetime: " .. os.date("%Y-%m-%d %H:%M:%S"),
                }
            end,
            kind = cmp.lsp.CompletionItemKind.Unit,
            insertText = function()
                return os.date("%Y-%m-%d %H:%M:%S")
            end,
        },
        {
            label = "timestamp",
            detail = "Unix timestamp",
            documentation = function()
                return {
                    kind = "markdown",
                    value = "Insert the timestamp: " .. os.date("%s"),
                }
            end,
            kind = cmp.lsp.CompletionItemKind.Unit,
            insertText = function()
                return os.date("%s")
            end,
        },
    })
end

return M
