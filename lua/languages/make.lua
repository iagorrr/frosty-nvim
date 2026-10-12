-- Recipes are only recognised when indented with hard tabs, so the global
-- `expandtab` has to be turned off for make buffers
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("frosty_make_indent", { clear = true }),
    desc = "Keep hard tabs in Makefile recipes",
    pattern = "make",
    callback = function(ev)
        vim.bo[ev.buf].expandtab = false
        vim.bo[ev.buf].shiftwidth = 0
        vim.bo[ev.buf].softtabstop = 0
    end,
})

local lsp = {}

return {
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = {
            servers = {
                autotools_ls = lsp,
            },
        },
    },
}
