-- See more about this at https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
return {
    opts = {
        configure = true,
        win = {
            style = "float",
            border = "rounded",
        },
    },
    -- stylua: ignore
    keys = {
        { "<A-0>", function() Snacks.lazygit() end, desc = "Open lazygit", },
    },
}
