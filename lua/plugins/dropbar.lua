local function config()
    local opts = {}
    require("dropbar").setup(opts)
end

return {
    {
        "Bekaboo/dropbar.nvim",
        config = config,
    },
}
