return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        enabled = true,
        priority = 1000,
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("tokyonight").setup({
                transparent = true,
                style = "moon",
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    floats = "transparent",
                }
                -- -- cambiar el color de los numero de linea
                -- on_highlights = function(hl)
                --     hl.LineNr = {
                --         fg = "#56B6C2"
                --     }
                -- end,
            })
            vim.cmd.colorscheme("tokyonight")
        end
    },
}
