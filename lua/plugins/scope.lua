local function config()
    require("scope").setup()
end

return {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = config,
}
