local pluginAlias = "f-person/auto-dark-mode.nvim"

local function config()
    local opts = {
        update_interval = 5000,
        set_dark_mode = function()
            vim.cmd.colorscheme "catppuccin-mocha"
        end,
        set_light_mode = function()
            vim.cmd.colorscheme "catppuccin-latte"
        end,
        fallback = "dark",
    }
    require("auto-dark-mode").setup(opts)
end

return {
    pluginAlias,
    config = config,
    event = "LazyDone",
}
