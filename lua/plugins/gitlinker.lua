local function config()
    require("gitlinker").setup()
end

return {
    "ruifm/gitlinker.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = config,

    event = "VeryLazy",
}
