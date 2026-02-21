local icons = require "icons"

function ToggleLualine()
    if vim.opt.laststatus:get() > 0 then
        require("lualine").hide()
        vim.opt.laststatus = 0
    else
        require("lualine").hide { unhide = true }
    end
end

local function config()
    local opts = {
        options = {

            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(str)
                        return icons.mode[str] or str
                    end,
                },
            },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {},
            lualine_x = { "searchcount", "selectioncount" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            "quickfix",
            "toggleterm",
        },
    }
    require("lualine").setup(opts)
end
return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",

    lazy = false,

    config = config,

    keys = {
        { "<leader>uL", ToggleLualine, "Toggle lualine" },
    },
}
