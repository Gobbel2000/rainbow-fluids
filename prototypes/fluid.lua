require("colors")

local template = {
    subgroup = "color-fluid",
    default_temperature = 25,
    max_temperature = 100,
    icon_size = 32,
    type = "fluid"
}
    
    
for i, v in ipairs(color_table) do
    local fluid = table.deepcopy(template)
    fluid.base_color = v.values
    fluid.flow_color = v.values
    fluid.icon = v.icon
    --create ascii string for the order. string.char(97) --> "a"
    fluid.order = string.char(i + 96)
    fluid.name = v.name
    data:extend{fluid}
end
