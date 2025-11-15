-- TODO: Improve lualine config
-- TODO: Lazy load lualine
-- TODO: Catppuccin integration

function ToggleLualine()
    if vim.opt.laststatus:get() > 0 then
        require("lualine").hide()
        vim.opt.laststatus = 0
    else
        require("lualine").hide { unhide = true }
    end
end

local function config()
    require("lualine").setup()
    require("lualine").hide()
    vim.opt.laststatus = 0
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
