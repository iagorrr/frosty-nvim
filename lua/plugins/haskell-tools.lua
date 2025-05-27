local function config()
    local ht = require "haskell-tools"
end

-- TODO: refactor this :))
local toggle_repl_cmd = "<cmd>lua require('haskell-tools').repl.toggle()<cr>"
local hoggle_definition_cmd = "<cmd>lua require('haskell-tools').hoogle.hoogle_signature()<cr>"
local evaluate_definition = "<cmd>lua require('haskell-tools').lsp.buf_eval_all()<cr>"

return {
    {
        "mrcjkb/haskell-tools.nvim",
        config = config,
    },

    mappings = {
        n = {
            ["<leader>h"] = {
                name = " Haskell",
                r = { toggle_repl_cmd, "Toggle Repl" },
                s = { hoggle_definition_cmd, "Hoggle function signature" },
                e = { evaluate_definition, "Evaluate all code snippets" },
            },
        },
    },
}
