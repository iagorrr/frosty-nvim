local function config()
    require("java").setup()
    vim.lsp.enable "jdtls"
end

return {
    "nvim-java/nvim-java",
    lazy = false,
    config = config,
}
