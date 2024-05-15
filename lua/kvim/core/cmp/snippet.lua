local ls = require("luasnip")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

local map = require("kvim.utils.keymap").map

local M = {}

function M.init()
    ls.config.set_config({
        history = false,
        updateevents = "TextChanged,TextChangedI",
    })

    ls.add_snippets("php", {
        s("class", fmt("class {name}\n{{\n\n}}", { name = i(1, "Class") })),
        s("eclass", fmt("class {name} extends {parent}\n{{\n\n}}", { name = i(1, "Class"), parent = i(2, "Parent") })),
        s(
            "iclass",
            fmt(
                "class {name} implements {interface}\n{{\n\n}}",
                { name = i(1, "Class"), interface = i(2, "Interface") }
            )
        ),
        s("fclass", fmt("final class {name}\n{{\n\n}}", { name = i(1, "FinalClass") })),
        s("aclass", fmt("abstract class {name}\n{{\n\n}}", { name = i(1, "AbstractClass") })),
        s(
            "enum",
            fmt("enum {name}\n{{\n\tcase {variant};\n}}", { name = i(1, "AbstractClass"), variant = i(2, "variant") })
        ),
        s("php", fmt("<?php\n\nnamespace {namespace};\n\nclass {name} \n{{\n\n}}", { namespace = i(1), name = i(2) })),
        s("prc", fmt("private const {const};", { const = i(1, "VALUE") })),
        s("puc", fmt("private const {const};", { const = i(1, "VALUE") })),
        s("prm", fmt("private function {name}(): {type}\n{{\n\n}}\n", { name = i(1, "method"), type = i(2, "void") })),
        s("pum", fmt("public function {name}(): {type}\n{{\n\n}}\n", { name = i(1, "method"), type = i(2, "void") })),
        s("pra", fmt("private {type} ${name};", { type = i(1, "type"), name = i(2, "Property") })),
        s("pua", fmt("public {type} ${name};", { type = i(1, "type"), name = i(2, "Property") })),
        s("pco", fmt("public function __construct()\n{{\n\n}}", {})),
    })

    ls.add_snippets("all", {
        s("today", { extras.partial(os.date, "%Y-%m-%d") }),
        s("now", { extras.partial(os.date, "%Y-%m-%d %H:%M:%S") }),
        s("timestamp", { extras.partial(os.date, "%s") }),
    })

    map({ "i", "s" }, "<c-n>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end)

    map({ "i", "s" }, "<c-p>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end)
end

return M
