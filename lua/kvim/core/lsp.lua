local keymapping = require("kvim.keymappings")
local utils = require("utils")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local M = {}

local servers = {
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
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
    intelephense = {},
    elixirls = {
        cmd = { vim.fn.expand("$HOME") .. "/.local/bin/elixir-ls" },
    },
    clangd = {},
    gopls = {},
    pyright = {},
}

local disabled_formatting_on_save = { "tsserver" }

function M.enable_format_on_save(client)
    if client.resolved_capabilities.document_formatting then
        local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = 0,
            group = lsp_formatting_group,
            callback = function()
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

function M.disable_format_on_save(client)
    client.resolved_capabilities.document_formatting = false
end

function M.enable_highlight(client)
    if client.resolved_capabilities.document_highlight then
        local lsp_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = 0,
            group = lsp_highlight_group,
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = 0,
            group = lsp_highlight_group,
            callback = function()
                vim.lsp.buf.clear_references()
            end,
        })
    end
end

function M.lsp_config()
    local mapping = {
        normal_mode = {
            ["K"] = "<cmd>:lua vim.lsp.buf.hover()<CR>",
            ["gd"] = "<cmd>:lua vim.lsp.buf.definition()<CR>",
            ["ga"] = "<cmd>:lua vim.lsp.buf.code_action()<CR>",
            ["gr"] = "<cmd>:lua vim.lsp.buf.references()<CR>",
            ["gi"] = "<cmd>:lua vim.lsp.buf.implementation()<CR>",
            ["<Leader>rn"] = "<cmd>:lua vim.lsp.buf.rename()<CR>",
            ["g["] = "<cmd>:lua vim.diagnostic.goto_prev()<CR>",
            ["g]"] = "<cmd>:lua vim.diagnostic.goto_next()<CR>",
            ["<S-u>"] = "<cmd>:lua vim.diagnostic.open_float()<CR>",
            ["<Leader>ff"] = "<cmd>:lua vim.lsp.buf.formatting()<CR>",
        },
        visual_mode = {
            ["<Leader>ff"] = "<cmd>:lua vim.lsp.buf.range_formatting()<CR>",
        },
    }

    local on_attach = function(client, bufnr)
        keymapping.load(mapping, bufnr)

        if utils.contains(disabled_formatting_on_save, client.name) then
            M.disable_format_on_save(client)
        else
            M.enable_format_on_save(client)
        end

        M.enable_highlight(client)
    end

    local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

    for server, config in pairs(servers) do
        config["on_attach"] = on_attach
        config["capabilities"] = capabilities

        lspconfig[server].setup(config)
    end
end

function M.handlers()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function M.diagnostics()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

function M.init()
    M.lsp_config()
    M.handlers()
    M.diagnostics()
end

return M
