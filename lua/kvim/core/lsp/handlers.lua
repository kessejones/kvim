local M = {}

function M.init()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

function M.rename()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, "textDocument/prepareRename", params, function(_, result, event)
        if result then
            local r_start
            local r_end
            if result.range then
                r_start = result.range.start
                r_end = result.range["end"]
            else
                r_start = result.start
                r_end = result["end"]
            end

            local text =
                vim.api.nvim_buf_get_text(event.bufnr, r_start.line, r_start.character, r_end.line, r_end.character, {})

            require("kvim.ui.input").rename({
                prompt = "New Name",
                default = table.concat(text),
            }, function(input)
                if not input or #input == 0 then
                    return
                end
                params.newName = input
                vim.lsp.buf_request(event.bufnr, "textDocument/rename", params, vim.lsp.handlers["textDocument/rename"])
            end)
        end
    end)
end

return M
