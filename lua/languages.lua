local languages = {}

languages.servers = {
    bashls = {},

    cssls = {},
    html = {},
    jsonls = {},

    lua_ls = {
        Lua = {
            format = { enable = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Both" },
        },
    },

    nil_ls = {},

    pylsp = {
        pylsp = {
            plugins = {
                ruff = { enabled = true },
            },
        },
    },

    rust_analyzer = {},

    clangd = {},
}

languages.formatters = {
    sh = { "shfmt" },

    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    json = { "prettierd" },
    less = { "prettierd" },
    markdown = { "prettierd" },
    scss = { "prettierd" },
    typescript = { "prettierd" }, -- BUG: Multiple imports causes an error
    yaml = { "prettierd" },

    lua = { "stylua" },

    nix = { "alejandra" },
}

return languages
