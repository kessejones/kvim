local utils = require("kvim.utils")

---@param str string
---@param deli string?
---@return string
local function pascalcase(str, deli)
    deli = deli or "\\"
    local value = ""
    for match in str:gmatch("[a-zA-Z0-9]+") do
        value = value .. match:gsub("^.", string.upper) .. deli
    end
    return value:sub(1, -2)
end

---@param dir string
---@return table<string,string>?
local function composer_autoloads(dir)
    local root = vim.fs.root(0, { "composer.json" })
    if root == nil then
        return nil
    end

    local content = vim.fn.readfile(root .. "/composer.json")
    local composer = vim.json.decode(table.concat(content))

    for prefix, src in pairs(composer["autoload"]["psr-4"]) do
        if dir:match(utils.escape_pattern(src)) then
            return {
                prefix = prefix,
                src = src,
            }
        end
    end
    return nil
end

local function snip_namespace()
    local filename = vim.api.nvim_buf_get_name(0)

    local root = vim.fs.root(0, { "composer.json" })
    local file_path = vim.fs.dirname(filename)
    local root_escaped = utils.escape_pattern(root .. "/")
    local relative_dir = file_path:gsub(root_escaped, "")

    if relative_dir == nil or relative_dir == "" then
        vim.notify("Could not find relative file of the file", vim.log.levels.WARN)
        return ""
    end

    local autoload = composer_autoloads(relative_dir)
    if autoload ~= nil then
        vim.notify("No namespace found on composer autoloads", vim.log.levels.WARN)

        local ns = string.gsub(relative_dir, autoload.src, autoload.prefix)

        return pascalcase(ns)
    end

    return pascalcase(relative_dir)
end

local function snip_classname()
    local filename = vim.api.nvim_buf_get_name(0)
    local basename = vim.fs.basename(filename)
    local name = basename:gsub("%.php", "")

    return pascalcase(name)
end

---@diagnostic disable: undefined-global
return {
    s("@ns", fmt("namespace {ns};", { ns = extras.partial(snip_namespace) })),

    s(
        "@class",
        fmt("<?php\n\nnamespace {ns};\n\nclass {name}\n{{\n\t{todo}\n}}", {
            ns = extras.partial(snip_namespace),
            name = extras.partial(snip_classname),
            todo = i(1),
        })
    ),

    s("@class", fmt("class {class}\n{{\n\n}}", { class = extras.partial(snip_classname) })),
    s(
        "@class",
        fmt(
            "class {name} extends {parent}\n{{\n\n}}",
            { name = extras.partial(snip_classname), parent = i(2, "Parent") }
        )
    ),
    s(
        "@class",
        fmt("class {name} extends {parent} implements {interface}\n{{\n\n}}", {
            name = extras.partial(snip_classname),
            parent = i(2, "Parent"),
            interface = i(3, "Interface"),
        })
    ),

    s(
        "@interface",
        fmt(
            "<?php\n\nnamespace {ns};\n\ninterface {name}\n{{\n\n}}",
            { ns = extras.partial(snip_namespace), name = extras.partial(snip_classname) }
        )
    ),

    s(
        "@enum",
        fmt("<?php\n\nnamespace {ns};\n\nenum {name}\n{{\n\tcase {variant};\n}}", {
            ns = extras.partial(snip_namespace),
            name = extras.partial(snip_classname),
            variant = i(2, "Variant"),
        })
    ),

    s("@toarray", fmt("public function toArray(): array\n{{\n\treturn [\n\t\t{value}\n\t];\n}}", { value = i(1) })),
    s("@tostring", fmt('public function toString(): string\n{{\n\treturn "{value}";\n}}', { value = i(1) })),
    s("@new", fmt("public function __construct()\n{{\n\t{todo}\n}}", { todo = i(1) })),
}
