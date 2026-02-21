-- BUG: It keep adding a blank line at the bottom
local ui = require "settings.ui"

local function config()
    local opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup", -- floating popup
            format = {},
            opts = {
                relative = "editor",
                row = 0, -- top of editor
                col = "50%",
            },
        },
        messages = {
            enabled = true,
            view = "notify",
        },
        routes = {
            {
                filter = { event = "msg_show" },
                opts = { skip = true }, -- skip messages that trigger extra line
            },
        },
        views = {
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    height = 10,
                },
                border = {
                    style = ui.border,
                    padding = { 0, 0 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
    }

    require("noice").setup(opts)
end

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    priority = 1501,
    config = config,
}
