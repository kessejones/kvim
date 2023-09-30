local rest = require("rest.nvim")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    rest.setup({
        result = {
            formatters = {
                json = "jq",
                html = function(body)
                    if vim.fn.executable("tidy") == 0 then
                        return body
                    end
                    -- stylua: ignore
                    local output = vim.fn.system({
                        "tidy", "-i", "-q",
                        "--tidy-mark", "no",
                        "--show-body-only", "auto",
                        "--show-errors", "0",
                        "--show-warnings", "0",
                        "-",
                    }, body)

                    if output:find('Error: Can\'t open "auto"') then
                        return body
                    end

                    return output:gsub("\n$", "")
                end,
            },
        },
    })

    vim.api.nvim_create_augroup("RestGroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = "RestGroup",
        pattern = { "*.http" },
        callback = function(args)
            keymappings.load({
                normal_mode = {
                    ["<Leader>n"] = rest.run,
                },
            }, args.buf)
        end,
    })
end

return M
