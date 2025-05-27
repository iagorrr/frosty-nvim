require "options"

local plugins = require "loader" {
    "aerial",
    "autopairs",
    "bufferline",
    "cmp",
    "conform",
    "dashboard",
    "debugprint",
    "direnv",
    "dressing",
    "dropbar",
    "gitsigns",
    "indent-blankline",
    "lspconfig",
    "luasnip",
    "neo-tree",
    "telescope",
    "treesitter",
    "web-devicons",
    "which-key",
    "toggleterm",
    "zen-mode",
    "noice",
    "nord",
}

require("lazy").setup(plugins, {})
