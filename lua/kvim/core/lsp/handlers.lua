local M = {}

local methods = vim.lsp.protocol.Methods

local function prepare_rename(bufnr)
    local params = vim.lsp.util.make_position_params(0, "utf-8")

    vim.lsp.buf_request(bufnr, methods.textDocument_prepareRename, params, function(_, result, event)
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

                ---@diagnostic disable-next-line
                params.newName = input
                vim.lsp.buf_request(
                    event.bufnr,
                    methods.textDocument_rename,
                    params,
                    vim.lsp.handlers[methods.textDocument_rename]
                )
            end)
        end
    end)
end

function M.rename()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if clients == nil or #clients == 0 then
        return
    end

    ---@diagnostic disable-next-line
    if clients[1].supports_method(methods.textDocument_prepareRename) then
        prepare_rename(bufnr)
    else
        vim.lsp.buf.rename()
    end
end

return M
