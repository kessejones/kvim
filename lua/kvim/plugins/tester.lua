return {
    "kessejones/tester.nvim",
    config = function()
        require("tester").setup()

        require("kvim.keymappings").load({
            normal_mode = {
                ["<leader>oo"] = require("tester").run_current_test,
                ["<leader>oa"] = require("tester").run_all_tests,
            },
        })
    end,
}
