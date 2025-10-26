local default_opts = {
    flavour = "frappe",

    background = {
        light = "latte",
        dark = "frappe",
    },

    transparent_background = true,

    float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },

    default_integrations = true,

    integrations = {
        markdown = true,
        semantic_tokens = true,

        native_lsp = {
            enabled = true,

            virtual_text = {},

            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
                ok = { "undercurl" },
            },

            inlay_hints = {
                background = true,
            },
        },
    },
}

local function config(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

-- local function bufferline_opts(_, opts)
--     opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
-- end
--
return {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = false,

    opts = default_opts,
    config = config,

    -- specs = {
    --     "akinsho/bufferline.nvim",
    --     optional = true,
    --     opts = bufferline_opts,
    -- },
}
