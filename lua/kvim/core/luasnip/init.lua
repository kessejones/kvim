local ls = require("luasnip")
local loader = require("luasnip.loaders.from_lua")

local map = require("kvim.utils.keymap").map

local M = {}

function M.init()
    ls.config.set_config({
        history = false,
        updateevents = "TextChanged,TextChangedI",
    })

    loader.load({ paths = { "./lua/kvim/core/luasnip/snippets" } })

    map({ "i", "s" }, "<c-n>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { desc = "Expand or jump for snippet node" })

    map({ "i", "s" }, "<c-p>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { desc = "Jump go back for snippet node" })
end

return M
