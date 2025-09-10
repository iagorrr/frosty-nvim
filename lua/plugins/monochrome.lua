local function config()
    require("monochrome").setup()
    vim.cmd.colorscheme "monochrome"
end

return {
    "kdheepak/monochrome.nvim",

    priority = 1000,
    lazy = false,

    config = config,
}
