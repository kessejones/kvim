local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local a = vim.api

local M = {}

local function lsp_highlight(bufnr, event, group, action)
    a.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = action,
    })
end

local function init_highlight(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        lsp_highlight(bufnr, "CursorHold", "LspDocumentHighlight", vim.lsp.buf.document_highlight)
        lsp_highlight(bufnr, "CursorMoved", "LspDocumentHighlight", vim.lsp.buf.clear_references)
    end
end

local function init_servers()
    local servers = {
        lua_ls = {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                        unusedLocalExclude = { "_*" },
                    },
                    workspace = {
                        library = {
                            vim.fn.expand("$VIMRUNTIME/lua"),
                            vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                            vim.fn.stdpath("config") .. "/lua",
                            vim.fn.stdpath("data") .. "/lazy/",
                        },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
        tsserver = {},
        rust_analyzer = {},
        dockerls = {},
        yamlls = {},
        html = {},
        cssls = {},
        phpactor = {
            init_options = {
                ["language_server_phpstan.enabled"] = false,
                ["language_server_psalm.enabled"] = false,
                ["indexer.exclude_patterns"] = {
                    "/vendor/**/Tests/**/*",
                    "/vendor/**/tests/**/*",
                    "/vendor/composer/**/*",
                    "/runtime/**/*",
                },
            },
        },
        elixirls = {
            cmd = { "elixir-ls" },
        },
        clangd = {},
        gopls = {},
        pyright = {},
        csharp_ls = {},
        nil_ls = {},
        nixd = {},
        emmet_ls = {},
        ocamllsp = {},
        nushell = {},
        zls = {},
    }

    local function map_keys(bufnr)
        nmap("K", function()
            vim.lsp.buf.hover()
        end, { desc = "Display hover information about the symbol ", buffer = bufnr })

        nmap("gs", function()
            vim.lsp.buf.signature_help()
        end, { desc = "Displays signature information about the symbol", buffer = bufnr })

        nmap("gd", function()
            vim.lsp.buf.definition()
        end, { desc = "Go to the definition", buffer = bufnr })

        nmap("ga", function()
            vim.lsp.buf.code_action()
        end, { desc = "Open code actions", buffer = bufnr })

        nmap("gi", function()
            vim.lsp.buf.implementation()
        end, { desc = "Go to implementation", buffer = bufnr })

        nmap("<Leader>rn", function()
            require("kvim.core.lsp.handlers").rename()
        end, { desc = "Rename symbol with popup window", buffer = bufnr })

        nmap("g[", function()
            vim.diagnostic.goto_prev()
        end, { desc = "Go to previous diagnostics", buffer = bufnr })

        nmap("g]", function()
            vim.diagnostic.goto_next()
        end, { desc = "Go to next diagnostics", buffer = bufnr })

        nmap("<S-u>", function()
            vim.diagnostic.open_float()
        end, { desc = "Show diagnostic in float window", buffer = bufnr })

        nmap("<Leader>ff", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Format code", buffer = bufnr })

        nmap("<Leader>fo", function()
            if vim.g.auto_format then
                vim.g.auto_format = false
                vim.notify("Format on save has been disabled", vim.log.levels.INFO)
            else
                vim.g.auto_format = true
                vim.notify("Format on save has been enabled", vim.log.levels.INFO)
            end
        end, { desc = "Toggle format on save", buffer = bufnr })

        vmap("<Leader>ff", function()
            vim.lsp.buf.format({
                mode = "v",
            })
        end, { desc = "Format code", buffer = bufnr })

        vmap("<Leader>ga", function()
            vim.lsp.buf.code_action({
                mode = "v",
            })
        end, { desc = "Open code actions", buffer = bufnr })
    end

    a.nvim_create_augroup("LspDocumentHighlight", { clear = true })
    local on_attach = function(client, bufnr)
        map_keys(bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        require("kvim.core.lsp.formatting").init(vim.bo[bufnr].filetype)
        init_highlight(client, bufnr)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    for server, config in pairs(servers) do
        config["on_attach"] = on_attach
        config["capabilities"] = capabilities

        lspconfig[server].setup(config)
    end
end

function M.init()
    vim.g.auto_format = true
    init_servers()

    require("kvim.core.lsp.handlers").init()
    require("kvim.core.lsp.diagnostics").init()
end

return M
