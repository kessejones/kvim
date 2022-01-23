local M = {  }
local keymapping = require('kvim.keymappings')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
    sumneko_lua = {
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				    },
                },
                telemetry = {
                    enable = false
                }
            }
        }
    },
    tsserver = { },
    rust_analyzer = { },
    html = { },
    css = { },
    intelephense = { },
}

function M:init()
    local mapping = {
        normal_mode = {
            ["K"] = "<cmd>:lua vim.lsp.buf.hover()<CR>",
            ["gd"] = "<cmd>:lua vim.lsp.buf.definition()<CR>",
            -- ["gs"] = "<cmd>:LspDocumentSymbolSearch<CR>",
            -- ["gS"] = "<cmd>:LspWorkspaceSymbolSearch<CR>",
            -- ["gr"] = "<cmd>:LspReferences<CR>",
            ["gi"] = "<cmd>:lua vim.lsp.buf.implementation()<CR>",
            -- ["gt"] = "<cmd>:LspTypeDefinition<CR>",
            ["<Leader>rn"] = "<cmd>:lua vim.lsp.buf.rename()<CR>",
            -- ["[g"] = "<cmd>:LspPreviousDiagnostic<CR>",
            -- ["]g"] = "<cmd>:LspNextDiagnostic<CR>",
        }
    }
    keymapping:load(mapping)

    local lspconfig = require('lspconfig')
    for server, config in pairs(servers) do
        lspconfig[server].setup(config)
    end
end

return M
