local lsp = {}

-- `biome` only runs on projects holding a biome config, `prettier` covers the rest
local formatter = { "biome", "prettier", stop_after_first = true }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                jsonls = lsp,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                json = formatter,
                jsonc = formatter,
            },
        },
    },
}
