vim.keymap.set({ "n", "i", "t" }, "<C-\\>", function()
    Snacks.terminal(nil, { win = { style = "float" } })
end)

return {
    enabled = true,
    win = {
        style = "float",
        border = "rounded",
    },
}
