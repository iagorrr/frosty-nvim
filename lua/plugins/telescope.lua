local function config()
    local telescope = require "telescope"

    local opts = {
        defaults = {
            layout_strategy = "vertical",
            sorting_strategy = "ascending",
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",

            layout_config = {
                horizontal = {
                    prompt_position = "top",
                },

                vertical = {
                    prompt_position = "top",
                    mirror = true,
                },
            },

            mappings = {
                n = {
                    q = require("telescope.actions").close,
                },
            },
        },
    }

    telescope.setup(opts)
    telescope.load_extension "ui-select"
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = config,
    },

    mappings = {
        n = {
            ["<leader>f"] = {
                name = "Telescope",

                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                F = { "<cmd>Telescope find_files no_ignore=true,hidden=true<cr>", "Find files (hidden & ignored)" },
                G = {
                    '<cmd>Telescope live_grep vimgrep_arguments={"rg","--no-hidden","--no-ignore","--with-filename","--line-number","--column"}<cr>',
                    "Live grep (hidden & ignore)",
                },
                g = { "<cmd>Telescope live_grep no_ignore=true,hidden=true<cr>", "Live grep" },
                r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
                x = { "<cmd>Telescope filetypes<cr>", "Set filetype" },
                b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer grep" },
            },
        },
    },

    colorscheme_integrations = {
        telescope = true,
    },

    highlights = function(colors)
        return {
            TelescopeSelection = { bg = colors.crust },
            TelescopePromptNormal = { bg = colors.crust },
            TelescopePromptBorder = { fg = colors.crust, bg = colors.crust },
            TelescopePromptTitle = { fg = colors.crust, bg = colors.blue, style = { "bold" } },
            TelescopePromptPrefix = { fg = colors.overlay0 },
            TelescopePreviewNormal = { bg = colors.mantle },
            TelescopePreviewBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle },
        }
    end,
}
