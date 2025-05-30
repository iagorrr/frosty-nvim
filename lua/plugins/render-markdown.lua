local function config()
    require("render-markdown").setup {

        link = {
            -- Turn on / off inline link icon rendering.
            enabled = true,
            -- Additional modes to render links.
            render_modes = false,
            -- How to handle footnote links, start with a '^'.
            footnote = {
                -- Turn on / off footnote rendering.
                enabled = false,
                -- Replace value with superscript equivalent.
                superscript = false,
                -- Added before link content.
                prefix = "",
                -- Added after link content.
                suffix = "",
            },
            -- Inlined with 'image' elements.
            image = "󰥶 ",
            -- Inlined with 'email_autolink' elements.
            email = "󰀓 ",
            -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
            hyperlink = "󰌹 ",
            -- Applies to the inlined icon as a fallback.
            highlight = "RenderMarkdownLink",
            -- Applies to WikiLink elements.
            wiki = {
                icon = "󱗖 ",
                body = function()
                    return nil
                end,
                highlight = "RenderMarkdownWikiLink",
            },
            -- Define custom destination patterns so icons can quickly inform you of what a link
            -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
            -- patterns match a link the one with the longer pattern is used.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | pattern   | matched against the destination text                            |
            -- | icon      | gets inlined before the link text                               |
            -- | kind      | optional determines how pattern is checked                      |
            -- |           | pattern | @see :h lua-patterns, is the default if not set       |
            -- |           | suffix  | @see :h vim.endswith()                                |
            -- | priority  | optional used when multiple match, uses pattern length if empty |
            -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
            custom = {
                web = { pattern = "^http", icon = "󰖟 " },
                discord = { pattern = "discord%.com", icon = "󰙯 " },
                github = { pattern = "github%.com", icon = "󰊤 " },
                gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
                google = { pattern = "google%.com", icon = "󰊭 " },
                neovim = { pattern = "neovim%.io", icon = " " },
                reddit = { pattern = "reddit%.com", icon = "󰑍 " },
                stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
                wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
                youtube = { pattern = "youtube%.com", icon = "󰗃 " },
            },
        },

        completions = { lsp = { enabled = true } },

        pipe_table = {
            -- Turn on / off pipe table rendering.
            enabled = true,
            -- Additional modes to render pipe tables.
            render_modes = false,
            -- Pre configured settings largely for setting table border easier.
            -- | heavy  | use thicker border characters     |
            -- | double | use double line border characters |
            -- | round  | use round border corners          |
            -- | none   | does nothing                      |
            preset = "none",
            -- Determines how the table as a whole is rendered.
            -- | none   | disables all rendering                                                  |
            -- | normal | applies the 'cell' style rendering to each row of the table             |
            -- | full   | normal + a top & bottom line that fill out the table when lengths match |
            style = "full",
            -- Determines how individual cells of a table are rendered.
            -- | overlay | writes completely over the table, removing conceal behavior and highlights |
            -- | raw     | replaces only the '|' characters in each row, leaving the cells unmodified |
            -- | padded  | raw + cells are padded to maximum visual width for each column             |
            -- | trimmed | padded except empty space is subtracted from visual width calculation      |
            cell = "padded",
            -- Amount of space to put between cell contents and border.
            padding = 1,
            -- Minimum column width to use for padded or trimmed cell.
            min_width = 0,
        -- Characters used to replace table border.
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal.
        -- stylua: ignore
        border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
        },
            -- Always use virtual lines for table borders instead of attempting to use empty lines.
            -- Will be automatically enabled if indentation module is enabled.
            border_virtual = false,
            -- Gets placed in delimiter row for each column, position is based on alignment.
            alignment_indicator = "━",
            -- Highlight for table heading, delimiter, and the line above.
            head = "RenderMarkdownTableHead",
            -- Highlight for everything else, main table rows and the line below.
            row = "RenderMarkdownTableRow",
            -- Highlight for inline padding used to add back concealed space.
            filler = "RenderMarkdownTableFill",
        },
    }
end

return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        config = config,
    },
}
