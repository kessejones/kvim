local M = {}

function M.init()
    require("rest-nvim").setup({
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
                      "--tidy-mark",      "no",
                      "--show-body-only", "auto",
                      "--show-errors",    "0",
                      "--show-warnings",  "0",
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
end

return M
