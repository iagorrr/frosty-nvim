require "options"

local plugins = require "loader" {
    "aerial",
    "autopairs",
    "bufferline",
    "cmp",
    "colorizer",
    "conform",
    "dashboard",
    "debugprint",
    "direnv",
    "dressing",
    "dropbar",
    "gitsigns",
    -- "guess-indent",
    "indent-blankline",
    "lspconfig",
    "luasnip",
    "neo-tree",
    "neogit",
    -- "notify",
    "surround",
    "telescope",
    "treesitter",
    "web-devicons",
    "which-key",
    "toggleterm",
    "zen-mode",
    "noice", -- Better UI plugin

    -- Colorschemes setup
    "kanagawa",
    "colorscheme",
}

require("lazy").setup(plugins, {
    defaults = {
        -- lazy = true
    },

    install = {
        colorscheme = { "catppuccin" },
    },
})
