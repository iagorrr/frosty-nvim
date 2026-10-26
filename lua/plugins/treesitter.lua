-- TODO: Lazy load treesitter
-- TODO: Add more treesitter textobjects

-- Flake bundles parsers using `treesitterParsers` and queries through `FROSTY_RUNTIMEPATHS`
local default_opts = {
    textobjects = {
        select = {
            lookahead = true,
        },
    },

    textobject_keymaps = {
        select = {
            ["af"] = { query = "@function.outer", desc = "function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ac"] = { query = "@class.outer", desc = "class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },
        },
    },
}

local function config(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("frosty_treesitter", { clear = true }),
        callback = function(args)
            if not pcall(vim.treesitter.start, args.buf) then
                return
            end

            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })

    -- Incremental selection is built into Neovim 0.12 as `an` and `in`
    vim.keymap.set("n", "<c-space>", "van", { remap = true, desc = "Start node selection" })
    vim.keymap.set("x", "<c-space>", "an", { remap = true, desc = "Expand node selection" })
    vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Shrink node selection" })

    require("nvim-treesitter-textobjects").setup(opts.textobjects)

    local select = require "nvim-treesitter-textobjects.select"

    for lhs, textobject in pairs(opts.textobject_keymaps.select) do
        vim.keymap.set({ "x", "o" }, lhs, function()
            select.select_textobject(textobject.query, "textobjects")
        end, { desc = textobject.desc })
    end
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",

    lazy = false,

    opts = default_opts,
    config = config,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                treesitter = true,
            },
        },
    },
}
