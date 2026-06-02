return {
    opts = {
        toggles = {
            dim = false,
            number = false,
            relativenumber = false,
        },
        center = true,
        show = {
            statusline = false,
        },
        win = { style = "zen" },

        zoom = {
            show = {
                statusline = false,
                tabline = false,
            },
        },

        on_open = function()
            vim.opt.number = false
            vim.opt.relativenumber = false
        end,
        on_close = function()
            vim.opt.number = true
            vim.opt.relativenumber = true
        end,
    },
}
