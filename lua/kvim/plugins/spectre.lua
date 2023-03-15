return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        ",fs",
        ",ff",
    },
    config = function()
        require("kvim.core.spectre").init()
    end,
}
