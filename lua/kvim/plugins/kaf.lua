return {
    "kessejones/kaf.nvim",
    keys = { "<Leader>et", "<Leader>ee", "<Leader>el", "<Leader>ep" },
    config = function()
        require("kaf").setup()
        local telescope = require("telescope")

        local nmap = require("kvim.utils.keymap").nmap

        nmap("<Leader>et", telescope.extensions.kaf.topics)
        nmap("<Leader>ee", telescope.extensions.kaf.clients)
        nmap("<Leader>el", telescope.extensions.kaf.messages)
        nmap("<Leader>ep", function()
            require("kaf.api").produce({ from_buffer = false })
        end)
    end,
}
