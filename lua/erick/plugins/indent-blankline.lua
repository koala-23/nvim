return {
   "lukas-reineke/indent-blankline.nvim",
   -- event = { "BufReadPost", "BufNewFile" },
   main = "ibl",
   opts = {
      scope = {
         enabled = false
      }
   },
   keys = {
      { "<leader>I", "<Cmd>IBLEnable<CR>",  desc = "Indent enabled" },
      { "<leader>II", "<Cmd>IBLDisable<CR>", desc = "Indent disabled" }
   },
}
