-- TODO: Lazy load lspconfig

local default_opts = {
    servers = {},

    diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = true,
        severity_sort = true,
        signs = { text = require("icons").diagnostics },
    },

    inlay_hints = false,
    codelens = true,
}

-- Hover docs often end with a documentation link, like the `[MDN Reference](...)`
-- typescript appends to web api entries. The markdown rendering hides the url
-- behind the link text, so grab it from the raw response instead
local function documentation_link(contents)
    local text

    if type(contents) == "string" then
        text = contents
    elseif contents.value then
        text = contents.value
    else
        local parts = {}

        for _, part in ipairs(contents) do
            table.insert(parts, type(part) == "string" and part or part.value)
        end

        text = table.concat(parts, "\n")
    end

    return text:match "%[[^%]]*%]%((%S-)%)" or text:match "https?://%S+"
end

local function open_documentation_link()
    local clients = vim.lsp.get_clients { bufnr = 0, method = "textDocument/hover" }

    if #clients == 0 then
        vim.notify("No language server to ask for documentation", vim.log.levels.WARN)
        return
    end

    local pending = #clients

    for _, client in ipairs(clients) do
        local params = vim.lsp.util.make_position_params(0, client.offset_encoding)

        client:request("textDocument/hover", params, function(_, result)
            pending = pending - 1

            local url = result and result.contents and documentation_link(result.contents)

            if url then
                pending = 0
                vim.ui.open(url)
            elseif pending == 0 then
                vim.notify("No documentation link under the cursor", vim.log.levels.WARN)
            end
        end, 0)
    end
end

local function config(_, opts)
    -- ad-hoc setting, to recognize avro as json
    vim.filetype.add {
        extension = {
            avsc = "json",
        },
    }
    -- Server setup
    for server, server_opts in pairs(opts.servers) do
        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
    end

    -- Diagnostics
    vim.diagnostic.config(opts.diagnostics)

    -- Inlay hints
    vim.lsp.inlay_hint.enable(opts.inlay_hints)

    -- Codelens
    vim.g.enable_codelens = opts.codelens or true

    -- TODO: Perhaps make this a global autocmd
    vim.lsp.config("*", {
        on_attach = function(client, buffer)
            if client.supports_method "textDocument/codeLens" then
                vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                    group = vim.api.nvim_create_augroup("frosty_codelens_refresh", { clear = true }),
                    desc = "Refresh buffer codelenses",
                    buffer = buffer,
                    callback = function()
                        if vim.g.enable_codelens then
                            vim.lsp.codelens.refresh()
                        end
                    end,
                })
            end
        end,
    })

    if Snacks then
        Snacks.toggle.diagnostics():map "<leader>uld"

        -- HACK: Snacks.toggle.inlay_hint (exceptionally) only toggles locally
        -- TODO: Upstream snacks inlay_hint toggle?
        Snacks.toggle({
            name = "Inlay Hints",
            get = function()
                return vim.lsp.inlay_hint.is_enabled()
            end,
            set = function(state)
                vim.lsp.inlay_hint.enable(state)
            end,
        }):map "<leader>ulh"

        Snacks.toggle({
            name = "Codelens",
            get = function()
                return vim.g.enable_codelens
            end,
            set = function(state)
                if not state then
                    vim.lsp.codelens.clear()
                end
                vim.g.enable_codelens = state
            end,
        }):map "<leader>ulc"
    end
end

return {
    "neovim/nvim-lspconfig",

    lazy = false,
    keys = {
        { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
        { "<leader>lo", open_documentation_link, desc = "Open documentation link" },
        { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help" },
        { "<leader>ld", vim.diagnostic.open_float, desc = "Diagnostics" },
        { "<leader>lr", vim.lsp.buf.rename, desc = "Rename reference" },

        { "<leader>lc", vim.lsp.buf.code_action, desc = "Code action" },
        { "<leader>lC", vim.lsp.codelens.run, desc = "Run codelens" },

        { "<leader>ljd", vim.lsp.buf.definition, desc = "Definition" },
        { "<leader>lji", vim.lsp.buf.implementation, desc = "Implementation" },
        { "<leader>ljt", vim.lsp.buf.type_definition, desc = "Type definition" },
        { "<leader>ljD", vim.lsp.buf.declaration, desc = "Declaration" },
    },

    opts = default_opts,
    config = config,
}
