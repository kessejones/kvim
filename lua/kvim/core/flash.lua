local flash = require("flash")
flash.setup({
    modes = {
        char = {
            keys = { "f", "F" },
            multi_line = false,
            autohide = true,
            jump_labels = true,
            char_actions = function(motion)
                return {
                    [motion:lower()] = "next",
                    [motion:upper()] = "prev",
                }
            end,
        },
    },
    prompt = {
        enabled = false,
    },
})

local function jump_forward()
    flash.jump({
        search = {
            forward = true,
            multi_window = false,
            wrap = false,
        },
    })
end

local function jump_backward()
    flash.jump({
        search = {
            forward = false,
            wrap = false,
            multi_window = false,
        },
    })
end

local function jump()
    flash.jump({ continue = true })
end

local function nmap(lhs, rhs, opts)
    vim.keymap.set("n", lhs, rhs, opts)
end

nmap("ss", jump_forward, { desc = "Jump forward" })
nmap("se", jump_backward, { desc = "Jump backward" })
nmap("sa", jump, { desc = "Jump buffer globaly" })
nmap("st", flash.treesitter, { desc = "Select area by treesitter" })
