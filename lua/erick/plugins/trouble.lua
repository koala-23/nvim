return {
   "folke/trouble.nvim",
   enabled = true,
   dependencies = "nvim-tree/nvim-web-devicons",
   keys = {
      {
         "<leader>tt",
         function()
            require("trouble").toggle("workspace_diagnostics")
         end,
         desc = "Trouble toggle"
      },
      {
         "<leader>tn",
         function()
            require("trouble").next({ skip_groups = true, jump = true })
         end,
         desc = "Trouble toggle next"
      },
      {
         "<leader>tp",
         function()
            require("trouble").previous({ skip_groups = true, jump = true })
         end,
         desc = "Trouble toggle previous"
      }
   },
   opts = {
      use_diagnostic_signs = true,
   }
}
