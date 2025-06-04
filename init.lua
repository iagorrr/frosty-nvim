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
    -- "dropbar",
    "gitsigns",
    "indent-blankline",
    "lspconfig",
    "luasnip",
    "neo-tree",
    "surround",
    "telescope",
    "treesitter",
    "web-devicons",
    "which-key",
    "toggleterm",
    "zen-mode",
    "noice",
    "nord",
    "haskell-tools",
    "render-markdown",
    -- Scala support
    -- "metals",
}

require("lazy").setup(plugins, {})
