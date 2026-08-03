local function open(path, target)
    if target == "oil" then
        vim.cmd("botright vsplit")
        vim.cmd.Oil(path)
    elseif target == "find_file" then
        vim.cmd({ cmd = "Pick", args = { "find_file", string.format("dir='%s'", path) } })
    end
end

local function treesitter_cursor_value()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row = cursor[1] - 1
    local col = cursor[2]

    local parser = vim.treesitter.get_parser(0)
    if not parser then
        return nil
    end
    local tree = parser:parse()[1]
    local root = tree:root()

    local node = root:named_descendant_for_range(row, col, row, col)
    if not node then
        return nil
    end

    if node:type() ~= "string_content" then
        return nil
    end

    return vim.treesitter.get_node_text(node, 0)
end

local function popup_create_directory(action)
    vim.ui.select({ "Yes", "No" }, {
        prompt = "This directory does not exist, do you want to create it?",
    }, function(item)
        if item == "Yes" then
            action()
        end
    end)
end

local function run(target)
    local text = treesitter_cursor_value()
    if text == nil then
        return
    end

    local path = text == "~" and vim.fs.dirname(vim.fn.expand(text)) or vim.fs.abspath(text)
    if not vim.uv.fs_stat(text) then
        popup_create_directory(function()
            vim.fn.mkdir(path, "p")
            open(path, target)
        end)
        return
    end

    open(path, target)
end

vim.keymap.set("n", "<Leader>th", function()
    run("oil")
end)
vim.keymap.set("n", "<Leader>tj", function()
    run("find_file")
end)
