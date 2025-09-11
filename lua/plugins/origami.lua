local opts = {
    useLspFoldsWithTreesitterFallback = true,
    pauseFoldsOnSearch = true,
    foldtext = {
        enabled = true,
        padding = 3,
        lineCount = {
            template = "%d lines", -- `%d` is replaced with the number of folded lines
            hlgroup = "Comment",
        },
        diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = true, -- requires `gitsigns.nvim`
    },
    autoFold = {
        enabled = false,
        kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
    },
    foldKeymaps = {
        setup = true, -- modifies `h`, `l`, and `$`
        hOnlyOpensOnFirstColumn = false,
    },
}

local function config()
    -- remove the brighter background that neovim adds by default in folded items
    vim.api.nvim_set_hl(0, "Folded", {})

    -- disables vim auto-folding
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99

    require("origami").setup(opts)
end

return {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    config = config,
}
