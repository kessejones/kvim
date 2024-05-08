local M = {}

local mode_adapter = {
    normal_mode = "n",
    visual_mode = "v",
    visual_block_mode = "x",
    insert_mode = "i",
    command_mode = "c",
    terminal_mode = "t",
}

local function set_keymaps(mode, key, val, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }
    vim.keymap.set(mode, key, val, opts)
end

local function load_mode(mode, mapping, bufnr)
    mode = mode_adapter[mode] and mode_adapter[mode] or mode
    for key, value in pairs(mapping) do
        set_keymaps(mode, key, value, bufnr)
    end
end

function M.load(mappings, bufnr)
    for mode, mapping in pairs(mappings) do
        load_mode(mode, mapping, bufnr)
    end
end

return M
