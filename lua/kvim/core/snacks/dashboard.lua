local header = [[
██╗  ██╗  ██╗   ██╗██╗███╗   ███╗
██║ ██╔╝  ██║   ██║██║████╗ ████║
█████╔╝   ██║   ██║██║██╔████╔██║
██╔═██╗   ╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗   ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝    ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local snacks = require("snacks")

local function get_root_dir()
    local git_dir = snacks.git.get_root()
    if not git_dir then
        return vim.fn.getcwd()
    end
    return git_dir
end

local root_parts = vim.split(get_root_dir(), "/")

local root_dir = get_root_dir()

return {
    enabled = false,
    preset = {
        header = header,
        keys = {
            {
                icon = " ",
                desc = "New Buffer",
                key = "i",
                action = ":ene",
            },
            {
                icon = " ",
                desc = "Open Current Folder",
                key = "o",
                action = "<Leader>tt",
            },
        },
    },
    formats = {
        file = function(item, _ctx)
            return { vim.fn.fnamemodify(item.file, ":."), hl = "file" }
        end,
    },
    sections = {
        {
            section = "header",
            padding = 3,
        },
        {
            icon = " ",
            title = "Recents ",
            file = vim.fn.fnamemodify(".", ":~"),
        },
        {
            section = "recent_files",
            cwd = true,
            indent = 2,
            padding = 2,
            limit = 10,
            filter = function(file)
                if file:find("/%.git/") then
                    return false
                end

                if #file <= #root_dir then
                    return false
                end

                local dir_parts = vim.split(vim.fs.dirname(file), "/")
                for i, r in ipairs(root_parts) do
                    if r ~= dir_parts[i] then
                        return false
                    end
                end

                return true
            end,
        },
        { section = "keys", padding = 2 },
        { section = "startup" },
    },
}
