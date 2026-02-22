local ui = require "settings.ui"
local icons = require "icons"
return {
    "nvim-zh/colorful-winsep.nvim",
    event = "VeryLazy",
    config = function()
        require("colorful-winsep").setup {
            border = ui.border,
            animate = {
                enabled = "false",
            },
            indicator_for_2wins = {
                -- only work when the total of windows is two
                position = "center", -- false to disable or choose between "center", "start", "end" and "both"
                symbols = {
                    -- the meaning of left, down ,up, right is the position of separator

                    start_left = icons.directions.simple.right, -- 󱞬
                    end_left = icons.directions.simple.right, -- 󱞪
                    start_down = icons.directions.simple.up, -- 󱞾
                    end_down = icons.directions.simple.up, -- 󱟀
                    start_up = icons.directions.simple.down, -- 󱞢
                    end_up = icons.directions.simple.down, -- 󱞤
                    start_right = icons.directions.simple.left, -- 󱞨
                    end_right = icons.directions.simple.left, -- 󱞦
                },
            },
        }
    end,
}
