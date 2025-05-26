local function config()
    local opts = {
        options = {
            highlights = require("nord").bufferline.highlights {},

            separator_style = { " ", " " },

            indicator = {
                style = "none",
            },

            offsets = {
                {
                    filetype = "neo-tree",
                    highlight = "NeoTreeNormal",
                    text = "",
                    padding = 1,
                    separator = false,
                },
            },
        },
    }

    require("bufferline").setup(opts)
    require("scope").setup()
end

return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "tiagovla/scope.nvim",
        },
        config = config,
    },

    mappings = {
        n = {
            ["<leader>b"] = {
                name = "Buffers",
                j = { "<cmd>BufferLinePick<cr>", "Jump" },
                f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
                h = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
                l = { "<cmd>BufferLineCycleNext<cr>", "Next" },
                H = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
                L = {
                    "<cmd>BufferLineCloseRight<cr>",
                    "Close all to the right",
                },
            },
        },
    },
}
