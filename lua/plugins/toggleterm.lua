local function config()
    local opts = {
        direction = "float",
        open_mapping = [[<c-\>]],
        start_in_insert = true,
    }
    require("toggleterm").setup(opts)
end

return {
    {
        "akinsho/toggleterm.nvim",
        config = config,
    },
    mappings = {
        n = {
            ["<leader>t"] = {
                name = "Terminal",
                f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
                h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
                v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
            },
        },
    },
}
