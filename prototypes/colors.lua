color_table = {}

local array = {1, 1, 1, 1,
               1, 0.75, 0.5, 0.25,
               0, 0, 0, 0,
               0, 0, 0, 0,
               0, 0.25, 0.5, 0.75,
               1, 1, 1, 1,
              }

for i=0, 23 do
    local r = array[i + 1]
    local g = array[(i + 16) % 24 + 1]
    local b = array[(i + 8) % 24 + 1]
    local name = "color-fluid-"..tostring(i+1)
    local icon = "__rainbow-fluids__/graphics/"..name..".png"
    local entry = {values = {r = r, g = g, b = b},
                   name = name,
                   icon = icon,
                  }
    table.insert(color_table, entry)
end

