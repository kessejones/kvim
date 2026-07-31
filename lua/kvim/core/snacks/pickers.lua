local snacks = require("snacks")

local function nmap(lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set("n", lhs, rhs, opts)
end

local function get_root_dir()
    local git_dir = snacks.git.get_root()
    if not git_dir then
        return vim.fn.getcwd()
    end
    return git_dir
end

local root_dir = get_root_dir()

local finder_ignore = {
    ".zig-cache",
    "zig-cache",
    "zig-out",
    ".git[\\/]*",
    ".jj[\\/]*",
    ".vscode[\\/]*",
    ".idea[\\/]*",
    ".direnv[\\/]*",
    "vendor[\\/]*",
    "node_modules[\\/]*",
    "target[\\/]*",
    "coverage[\\/]*",
    "code_coverage_html[\\/]*",
    ".phpunit.cache",
    "test[\\/]reports[\\/]*",
    "tests[\\/]report[\\/]*",
    "tests[\\/]reports[\\/]*",
    "_build[\\/]*",
    "build[\\/]*",
    "Build[\\/]*",
    "Toolchain",
    "deps[\\/]*",
    ".elixir_ls",
    ".DS_Store",
    "*.o",
    "*.so",
    "*.mp4",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.webp",
    "*.db",
    "*.img",
}

nmap("<leader>rN", function()
    snacks.rename.rename_file()
end, { desc = "Rename File" })

nmap("<C-p>", function()
    snacks.picker.files({
        hidden = true,
        ignored = true,
        exclude = finder_ignore,
        matcher = {
            sort_empty = true,
            frecency = true,
        },
        layout = {
            preview = false,
        },
    })
end, { desc = "Picker" })

nmap("<Leader>f/", function()
    snacks.picker.lines()
end)

nmap("<Leader>fl", function()
    snacks.picker.grep({
        need_search = true,
    })
end)

nmap("<Leader>fb", function()
    snacks.picker.buffers()
end)

nmap("<Leader>fu", function()
    snacks.picker.undo()
end)

nmap("<Leader>ft", function()
    snacks.picker.lsp_type_definitions()
end)

nmap("<Leader>fs", function()
    snacks.picker.lsp_symbols({
        filter = {
            default = {
                "Variable",
                "Constant",
                "Class",
                "Constructor",
                "Enum",
                "Field",
                "Function",
                "Interface",
                "Method",
                "Module",
                "Namespace",
                "Package",
                "Property",
                "Struct",
                "Trait",
            },
        },
    })
end)

nmap("<Leader>fw", function()
    snacks.picker.grep_word()
end)

nmap("<Leader>fr", function()
    snacks.picker.registers()
end)

nmap("<Leader>fj", function()
    snacks.picker.recent({
        filter = {
            paths = {
                [root_dir .. "/.git/"] = false,
                [root_dir] = true,
            },
        },
    })
end)

nmap("<Leader>fg", function()
    snacks.picker.git_log_file()
end)

nmap("<Leader>fd", function()
    snacks.picker.diagnostics()
end)
