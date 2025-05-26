local function config()
    local which_key = require "which-key"

    local opts = {
        win = {
            border = "single", -- single | double
        },
        layout = {
            align = "center",
        },
    }

    which_key.setup(opts)

    vim.g.mapleader = " "

    for mode, mappings in pairs(FROSTY_CONFIG.mappings) do
        which_key.register(mappings, { mode = mode })
    end
end

return {
    {
        "folke/which-key.nvim",
        config = config,
    },

    colorscheme_integrations = {
        -- which_key = true,
    },
}
