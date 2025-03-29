local M = {}

vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

local function lsp_highlight(bufnr, event, group, action)
    vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = action,
    })
end

function M.init(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        lsp_highlight(bufnr, "CursorHold", "LspDocumentHighlight", vim.lsp.buf.document_highlight)
        lsp_highlight(bufnr, "CursorMoved", "LspDocumentHighlight", vim.lsp.buf.clear_references)
    end
end

return M
