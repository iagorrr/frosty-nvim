-- BUG: It keep adding a blank line at the bottom

local function config()
    local opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup", -- floating popup
            format = {},
            opts = {
                relative = "editor",
                row = 1, -- top of editor
                col = "50%",
                width = 60,
            },
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
                    width = 60,
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
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
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
    lazy = false,
    priority = 1501,
    config = config,
}
