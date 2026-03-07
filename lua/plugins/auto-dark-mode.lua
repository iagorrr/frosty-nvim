local pluginAlias = "iagorrr/auto-dark-mode.nvim"
local ui = require "settings.ui"

local function config()
    local opts = {
        update_interval = 1000,
        set_dark_mode = function()
            vim.notify("auto-dark-mode: Using to dark mode " .. ui.darkColorscheme)
            vim.cmd.colorscheme(ui.darkColorscheme)
        end,
        set_light_mode = function()
            vim.notify("auto-dark-mode: Using to light mode " .. ui.lightColorscheme)
            vim.cmd.colorscheme(ui.lightColorscheme)
        end,
        fallback = "dark",
    }
    require("auto-dark-mode").setup(opts)
end

return {
    pluginAlias,
    config = config,
    lazy = false,
}
