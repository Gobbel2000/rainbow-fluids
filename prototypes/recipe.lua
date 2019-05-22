require("colors")

local template = {
    category = "chemistry",
    --subgroup = "color-fluid",
    enabled = true,
    energy_required = 2,
    icon_size = 32,
    ingredients = {
        {
         amount = 100,
         name = "water",
         type = "fluid"
        }
    },
    results = {
        {
         amount = 100,
         type = "fluid"
        }
    },
    type = "recipe"
}

local color_recipes = {}

for i, v in ipairs(color_table) do
    local recipe = table.deepcopy(template)
    recipe.crafting_machine_tint = {
        primary = v.values,
        secondary = v.values,
        tertiary = v.values
    }
    recipe.icon = v.icon
    recipe.results[1].name = v.name
    --create ascii string for the order. string.char(97) --> "a"
    recipe.order = string.char(i + 96)
    recipe.name = v.name
    table.insert(color_recipes, recipe)
end

--Base recipe for red
color_recipes[1].ingredients = {
    {
     amount = 100,
     name = "water",
     type = "fluid"
    },
    {"automation-science-pack", 1}
}

--Base recipe for green
color_recipes[9].ingredients = {
    {
     amount = 100,
     name = "water",
     type = "fluid"
    },
    {"logistic-science-pack", 1}
}

--Base recipe for blue
color_recipes[17].ingredients = {
    {
     amount = 100,
     name = "water",
     type = "fluid"
    },
    {"chemical-science-pack", 1}
}

--Generating all color mixing recipes
for i, v in ipairs(color_recipes) do
    --exclude the base colors 1, 9 and 17
    if (i-1) % 8 ~= 0 then
        --Two colors mix to the one in their middle. The largest common divisor of i-1 and 4
        --defines, how many mixing steps are needed for a color. Creating a special case for
        --3 and using %4 otherwise simplifies that process. We do -2 first and then +1 to get
        --values from 1-4 instead of 0-3. 
        local tier = ((i-2) % 4) + 1
        if tier == 3 then 
            tier = 1 
        end
        v.ingredients = {
            {
             --50, because the recipe gives 100 units each
             amount = 50,
             --The tier value from before is the distance of the result color to the ingredient
             --colors. E.g.: color 2 is 1 away from its ingredients 1 and 3. color 3 is 2 away 
             --from 1 and 5 etc.
             name = color_recipes[(i - tier) % 24].name,
             type = "fluid"
             },
            {
             amount = 50,
             name = color_recipes[(i + tier) % 24].name,
             type = "fluid"
             }
            }
    end
end

data:extend(color_recipes)
