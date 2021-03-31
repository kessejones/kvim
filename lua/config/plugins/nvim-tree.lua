local utils = require('utils')
local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_hide_dotfiles = false
vim.g.nvim_tree_tab_open = false
vim.g.nvim_tree_auto_open = true
vim.g.nvim_tree_auto_ignore_ft = 'startify'
vim.g.nvim_tree_follow = true
vim.g.nvim_tree_indent_markers = true
vim.g.nvim_tree_disable_netrw = false

utils.map('n', '<C-b>', ':NvimTreeToggle<CR>')

vim.g.nvim_tree_bindings = {
    ["<CR>"] = tree_cb("tabedit"),
    ["l"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["v"] = tree_cb("vsplit"),
    ["s"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["h"] = tree_cb("close_node"),
    ["<BS>"] = tree_cb("close_node"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    ["I"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
}

