local inlay_hints = {
    parameterNames = { enabled = "literals" },
    parameterTypes = { enabled = true },
    variableTypes = { enabled = false },
    propertyDeclarationTypes = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
}

local lsp = {
    settings = {
        typescript = { inlayHints = inlay_hints },
        javascript = { inlayHints = inlay_hints },

        vtsls = {
            -- Prefer the typescript version installed in the project
            autoUseWorkspaceTsdk = true,

            experimental = {
                completion = { enableServerSideFuzzyMatch = true },
            },
        },
    },
}

-- `biome` only runs on projects holding a biome config, `prettier` covers the rest
local formatter = { "biome", "prettier", stop_after_first = true }

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                vtsls = lsp,
            },
        },
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                javascript = formatter,
                javascriptreact = formatter,
                typescript = formatter,
                typescriptreact = formatter,
            },
        },
    },
}
