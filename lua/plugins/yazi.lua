return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>y",
            mode = { "n", "v" },
            "<cmd>Yazi toggle<cr>",
            desc = "Yazi toggle",
        },
        {
            "<leader>Y",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi (reveal)",
        },
    },
    opts = {
        keymaps = {
            show_help = "<f1>",
        },
    },
}
