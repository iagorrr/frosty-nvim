-- Highlight's unrelatd to any plugin may be defined here
-- they will be loaded by `loader.lua`

return function(colors)
    return {
        Search = { bg = colors.surface0, style = { "bold" } },
        CurSearch = { fg = colors.text, bg = colors.base, style = { "bold", "underline" } },
        IncSearch = { link = "CurSearch" },
        FloatBorder = { bg = colors.base, fg = colors.surface0 },
        NormalFloat = { bg = colors.base },
    }
end
