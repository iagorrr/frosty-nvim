local ui = require "settings.ui"

local opts = {
    menu = {
        win_configs = {
            border = ui.border,
        },
    },
}

local function config()
    local dropbar = require "dropbar"
    dropbar.setup(opts)
end

return {
    "Bekaboo/dropbar.nvim",

    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    config = config,

    event = "VeryLazy",

    keys = {
        {
            "<leader>dp",
            function()
                require("dropbar.api").pick()
            end,
            desc = "Pick symbosl in winbar",
        },
    },
}
