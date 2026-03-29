local neogit = require("neogit")

neogit.setup({
    console_timeout = 5000,
    disable_hint = true,
    auto_show_console = false,
    integrations = {
        diffview = true,
    },

    mappings = {
        finder = {
            ["<cr>"] = "Select",
            ["<c-c>"] = "Close",
            ["<esc>"] = "Close",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<c-k>"] = "Previous",
            ["<c-j>"] = "Next",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
            ["<tab>"] = "MultiselectToggleNext",
            ["<s-tab>"] = "MultiselectTogglePrevious",
        },
    },
})

vim.keymap.set("n", "<Leader>gg", function()
    require("neogit").open({})
end, { desc = "Open neogit" })
