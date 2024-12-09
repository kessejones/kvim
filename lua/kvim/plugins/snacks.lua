return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("kvim.core.snacks").init()
    end,
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "snacks_dashboard",
            callback = function(args)
                require("kvim.utils.nmap").nmap("i", ":ene<CR>", { buffer = args.buf, noremap = true })
            end,
        })
    end,
}
