local function config()
    -- Settings
    vim.g.nord_contrast = false
    vim.g.nord_borders = true
    vim.g.nord_italic = true
    vim.g.nord_bold = true

    vim.g.nord_uniform_diff_background = false
    vim.g.nord_disable_background = true
    vim.g.nord_enable_sidebar_background = false

    -- Load the colorscheme
    require("nord").set()
end

return {
    {
        "shaunsingh/nord.nvim",
        name = "nord",
        config = config,
    },
}
