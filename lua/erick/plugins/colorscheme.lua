return {
   {
      'rose-pine/neovim',
      name = 'rose-pine',
      lazy = false,
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
            transparent_background = true,
            styles = {
               comments = { "italic" },
               keywords = { "italic" }
            },
            integrations = { notify = true },
         })
         -- vim.cmd.colorscheme "catppuccin"
      end
   },
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         ---@diagnostic disable-next-line: missing-fields
         require("tokyonight").setup({
            transparent = true,
            style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
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
