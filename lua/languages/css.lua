-- Tailwind directives are unknown to the vscode css server, so its linter is
-- told to ignore them instead of warning on every `@tailwind`/`@apply`
local unknown_at_rules = { lint = { unknownAtRules = "ignore" } }

local lsp = {
    settings = {
        css = unknown_at_rules,
        scss = unknown_at_rules,
        less = unknown_at_rules,
    },
}

-- Only attaches on projects holding a tailwind config
local tailwind = {}

-- `biome` only runs on projects holding a biome config, `prettier` covers the rest
local formatter = { "biome", "prettier", stop_after_first = true }

-- Biome doesn't handle scss/less
local preprocessor_formatter = { "prettier" }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                cssls = lsp,
                tailwindcss = tailwind,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                css = formatter,
                scss = preprocessor_formatter,
                less = preprocessor_formatter,
            },
        },
    },
}
