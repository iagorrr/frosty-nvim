local function fun(t) end

local function config()
    local opts = {
        direction = "float",
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        size = 20,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        shading_factor = -30, -- the percentage by which to lighten dark terminal background, default: -30
        shading_ratio = -3, -- the ratio of shading factor for light/dark terminal background, default: -3
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = false,
        persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered
        close_on_exit = false, -- close the terminal window when the process exits
        clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
        -- Change the default shell. Can be a string or a function returning a string
        shell = vim.o.shell,
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            -- The border key is *almost* the same as 'nvim_open_win'
            -- see :h nvim_open_win for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
            -- width = 80,
            -- height = 40,
            -- row = 40,
            -- col = 40,
            winblend = 0,
            -- zindex = <value>,
            -- title_pos = "center", -- left' | 'center' | 'right', position of the title of the floating window
        },
        winbar = {
            enabled = false,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
        responsiveness = {
            -- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
            -- instead of next to each other
            -- default = 0 which means the feature is turned off
            horizontal_breakpoint = 135,
        },
    }

    require("toggleterm").setup(opts)
end

return {
    {
        "akinsho/toggleterm.nvim",
        config = config,
    },
    mappings = {
        n = {
            ["<leader>t"] = {
                name = "Terminal",
                f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
                h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
                v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
            },
        },
    },
}
