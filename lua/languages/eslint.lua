-- Only attaches on projects holding an eslint config
local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                eslint = lsp,
            },
        },
    },
}
