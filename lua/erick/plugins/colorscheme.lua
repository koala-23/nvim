return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                disable_italics = false,
                disable_background = true,
                disable_float_background = true,
            })
            -- vim.cmd.colorscheme("rose-pine")
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = {         -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                trnasparent_background = true,
                styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                },
                integrations = {
                    notify = true,
                },
            })
            -- vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    floats = "transparent"
                },
                -- cambiar el color de los numero de linaa
                on_highlights = function(hl)
                    hl.LineNr = {
                        fg = "#56B6C2"
                    }
                end,
            })
            -- vim.cmd.colorscheme("tokyonight")
        end
    },
    -- brackground dark
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = "italic",
                    }
                }
            })
            -- vim.cmd.colorscheme("nightfox")
        end
    },
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require('github-theme').setup({
              options = {
                    transparent = true,
                    styles = {
                        comments = "italic",
                    }
                }
            })
            vim.cmd.colorscheme "github_dark_tritanopia"
        end,
    }
}
