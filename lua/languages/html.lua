local lsp = {}

-- Emmet abbreviations, also expanded inside jsx/tsx
local emmet = {}

local formatter = { "prettier" }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                html = lsp,
                emmet_language_server = emmet,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                html = formatter,
            },
        },
    },
}
