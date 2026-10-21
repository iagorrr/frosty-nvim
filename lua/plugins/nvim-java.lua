local opts = {
    spring_boot_tools = {
        enable = false,
        auto_install = false,
    },

    java_debug_adapter = {
        enable = false,
        auto_install = false,
    },
}
local function config()
    require("java").setup(opts)
    vim.lsp.enable "jdtls"
end

return {
    "nvim-java/nvim-java",
    dependencies = {
        -- Declared by nvim-java's own lazy.lua, but only needed by
        -- spring_boot_tools, which is disabled above
        { "JavaHello/spring-boot.nvim", enabled = false },
    },
    lazy = false,
    config = config,
}
