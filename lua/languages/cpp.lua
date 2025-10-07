local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                clangd = lsp,
            },
        },
    },
}
