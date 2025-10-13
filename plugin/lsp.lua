local keymap = require("kvim.utils.keymap")
local lsp_highlight = require("kvim.core.lsp.highlight")
local lsp_formatting = require("kvim.core.lsp.formatting")
local lsp_diagnostics = require("kvim.core.lsp.diagnostics")

local nmap = keymap.nmap
local vmap = keymap.vmap

local function lsp_keymaps(bufnr)
    nmap("gd", function()
        vim.lsp.buf.definition()
    end, { desc = "Go to the definition", buffer = bufnr })

    nmap("ga", function()
        vim.lsp.buf.code_action()
    end, { desc = "Open code actions", buffer = bufnr })

    nmap("gi", function()
        vim.lsp.buf.implementation()
    end, { desc = "Go to implementation", buffer = bufnr })

    nmap("grn", function()
        require("kvim.core.lsp.handlers").rename()
    end, { desc = "Rename symbol with popup window", buffer = bufnr })

    nmap("g[", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, { desc = "Go to previous diagnostics", buffer = bufnr })

    nmap("g]", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, { desc = "Go to next diagnostics", buffer = bufnr })

    nmap("<S-u>", function()
        vim.diagnostic.open_float()
    end, { desc = "Show diagnostic in float window", buffer = bufnr })

    nmap("gf", function()
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

    vmap("gf", function()
        vim.lsp.buf.format({ mode = "v" })
    end, { desc = "Format code", buffer = bufnr })

    vmap("ga", function()
        vim.lsp.buf.code_action({ mode = "v" })
    end, { desc = "Open code actions", buffer = bufnr })

    nmap("gI", function()
        require("snacks").picker.lsp_implementations()
    end, { desc = "Fuzzy find implementations", buffer = bufnr })

    nmap("gr", function()
        require("snacks").picker.lsp_references()
    end, { desc = "Fuzzy find references", buffer = bufnr })

    nmap("gu", function()
        require("snacks").picker.diagnostics()
    end, { desc = "Fuzzy find diagnostics", buffer = bufnr })
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local ft = vim.bo[args.buf].filetype

        ---@diagnostic disable-next-line
        if client.supports_method(vim.lsp.protocol.Methods.textDocument_foldingRange) then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        lsp_formatting.init(ft)
        lsp_highlight.init(client, args.buf)

        lsp_keymaps(args.buf)
    end,
})

vim.g.auto_format = true

lsp_diagnostics.init()

vim.lsp.enable({
    "ols",
    "lua_ls",
    "clangd",
    "cssls",
    "dockerls",
    "elixirls",
    "gopls",
    "kulala_ls",
    "lua_ls",
    "nil_ls",
    "nixd",
    "phpactor",
    "rust_analyzer",
    "ts_ls",
    "yamlls",
    "zls",
    "copilot_ls",
})

vim.api.nvim_create_user_command("LspRestart", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    vim.lsp.stop_client(clients)
    vim.cmd.update()
    vim.defer_fn(vim.cmd.edit, 1000)
end, {})
