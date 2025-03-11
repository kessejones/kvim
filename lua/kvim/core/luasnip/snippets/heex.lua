---@diagnostic disable: undefined-global
return {
    s("@el", fmt("<%= {el} %>", { el = i(1, "") })),
    s("@if", fmt("<%= if {el} do %>\n\n<% end %>", { el = i(1, "") })),
    s("@for", fmt("<%= for {i} <- @{list} do %>\n\n<% end %>", { i = i(1, "i"), list = i(2, "") })),
}
