local plugin_path = "sphamba/smear-cursor.nvim"
local opts = {
    stiffness = 0.5,
    trailing_stiffness = 0.5,
    matrix_pixel_threshold = 0.5,
}

local function config()
    require("smear_cursor").setup(opts)
end

return {
    plugin_path,
    config = config,
    lazy = false,
}
