local keymapping = require("kvim.keymappings")
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
}

function M:enable_format_on_save(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
            ]])
    end
end

function M:lsp_config()
    local on_attach = function(client)
        local mapping = {
            normal_mode = {
                ["K"] = "<cmd>:lua vim.lsp.buf.hover()<CR>",
                ["gd"] = "<cmd>:lua vim.lsp.buf.definition()<CR>",
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

        keymapping:load(mapping)
        self:enable_format_on_save(client)
    end

    local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    for server, config in pairs(servers) do
        config["on_attach"] = on_attach
        config["capabilities"] = capabilities

        lspconfig[server].setup(config)
    end
end

function M:handlers()
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function M:init()
    self:lsp_config()
    self:handlers()
end

return M
