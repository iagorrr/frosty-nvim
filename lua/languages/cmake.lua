local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                cmake = lsp,
            },
        },
    },
}
