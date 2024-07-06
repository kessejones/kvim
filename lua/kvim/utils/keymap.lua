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

function M.map(mode, key, action, opts)
    opts = opts or {}

    opts = vim.tbl_extend("force", opts, {
        silent = true,
    })

    vim.keymap.set(mode, key, action, opts)
end

function M.imap(key, action, opts)
    M.map("i", key, action, opts)
end

function M.nmap(key, action, opts)
    M.map("n", key, action, opts)
end

function M.vmap(key, action, opts)
    M.map("v", key, action, opts)
end

function M.tmap(key, action, opts)
    M.map("t", key, action, opts)
end

return M
