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
    dockerls = { },
    yamlls = { },
    html = { },
    cssls = { },
    intelephense = { },
    elixirls = {
        cmd = { vim.fn.expand('$HOME') .. "/.local/bin/elixir-ls" }
    }
}



function M:init()
    local set_format_on_save = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
            ]])
    end
    end

    local on_attach = function(client)
        local mapping = {
            normal_mode = {
                ["K"] = "<cmd>:lua vim.lsp.buf.hover()<CR>",
                ["gd"] = "<cmd>:lua vim.lsp.buf.definition()<CR>",
                ["gr"] = "<cmd>:lua vim.lsp.buf.references()<CR>",
                ["gi"] = "<cmd>:lua vim.lsp.buf.implementation()<CR>",
                ["<Leader>rn"] = "<cmd>:lua vim.lsp.buf.rename()<CR>",
                ["g["] = "<cmd>:lua vim.lsp.diagnostic.goto_prev()<CR>",
                ["g]"] = "<cmd>:lua vim.lsp.diagnostic.goto_next()<CR>",
                ["<S-u>"] = "<cmd>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
                ["<Leader>ff"] = "<cmd>:lua vim.lsp.buf.formatting()<CR>",
            },
            visual_mode = {
                ["<Leader>ff"] = "<cmd>:lua vim.lsp.buf.range_formatting()<CR>",
            }
        }

        keymapping:load(mapping)

        set_format_on_save(client)
    end

    local lspconfig = require('lspconfig')
    for server, config in pairs(servers) do
        config['on_attach'] = on_attach
        lspconfig[server].setup(config)
    end

end

return M
