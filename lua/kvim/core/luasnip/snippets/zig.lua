---@diagnostic disable: undefined-global
return {
    s(".self", fmt("const Self = @This();", {})),
    s(
        ".st",
        fmt("const {name} = struct {{}}", {
            name = i(1, "Struct"),
        })
    ),
}
