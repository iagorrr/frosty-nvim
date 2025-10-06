vim.keymap.set({ "n", "i", "t" }, "<C-\\>", function()
    Snacks.terminal(nil, { win = { style = "float" } })
end)

return {
    opts = {
        enabled = true,
        win = {
            style = "float",
            border = "rounded",
        },
    },
    keys = {},
}
