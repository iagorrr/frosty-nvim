-- TODO: Configure diffview (modularise?)

local default_opts = {
    integrations = {
        diffview = true,
    },
}

local keys = {
    {
        "<leader>gn",
        "<cmd>Neogit kind=tab<cr>",
        desc = "Toggle Neogit",
    },

    {
        "<leader>hs",
        function()
            require("gitsigns").stage_hunk()
        end,
        desc = "Stage hunk",
    },
    {
        "<leader>hr",
        function()
            require("gitsigns").reset_hunk()
        end,
        desc = "Discard hunk",
    },
    {
        "<leader>hu",
        function()
            require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo stage hunk",
    },
}

-- Config function defined in `plugins/neo-tree.lua`
return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },

    keys = keys,

    cmd = "Neogit",

    opts = default_opts,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                diffview = true,
                neogit = true,
            },
        },
    },
}
