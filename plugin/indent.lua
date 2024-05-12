local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap

local modes = setmetatable({
    visual = {
        left = "<gv",
        right = ">gv",
    },
    normal = {
        left = "<<",
        right = ">>",
    },
}, {
    __call = function(tbl, d, v)
        local mode = v and "visual" or "normal"
        return tbl[mode][d]
    end,
})

local cursor = setmetatable({
    left = function()
        local cur = vim.api.nvim_win_get_cursor(0)
        local col = cur[2] - vim.bo.tabstop
        if col < 0 then
            return cur
        end

        return { cur[1], col }
    end,
    right = function()
        local cur = vim.api.nvim_win_get_cursor(0)
        local col = cur[2] + vim.bo.tabstop
        return { cur[1], col }
    end,
}, {
    __call = function(tbl, d)
        return tbl[d]()
    end,
    __index = function()
        assert(false, "invalid function")
    end,
})

local function indent(dir, visual)
    visual = visual or false

    local mode = modes(dir, visual)
    local cur = cursor(dir)

    vim.cmd.normal({ bang = true, args = { mode } })
    vim.api.nvim_win_set_cursor(0, cur)
end

-- Indent
nmap("<", function()
    indent("left")
end)
nmap(">", function()
    indent("right")
end)

vmap("<", function()
    indent("left", true)
end)

vmap(">", function()
    indent("right", true)
end)
