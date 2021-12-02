local M = {  }
local keymapping = require('kvim.keymappings')

function M:init() 
    local mapping = {
        normal_mode = {
            ["K"] = "<cmd>:LspHover<CR>",
            ["gd"] = "<cmd>:LspDefinition<CR>",
            ["gs"] = "<cmd>:LspDocumentSymbolSearch<CR>",
            ["gS"] = "<cmd>:LspWorkspaceSymbolSearch<CR>",
            ["gr"] = "<cmd>:LspReferences<CR>",
            ["gi"] = "<cmd>:LspImplementation<CR>",
            ["gt"] = "<cmd>:LspTypeDefinition<CR>",
            ["<Leader>rn"] = "<cmd>:LspRename<CR>",
            ["[g"] = "<cmd>:LspPreviousDiagnostic<CR>",
            ["]g"] = "<cmd>:LspNextDiagnostic<CR>",
        }
    }
    keymapping:load(mapping)
end

return M
