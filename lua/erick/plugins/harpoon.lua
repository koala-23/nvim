local keys = {}
local binds = 5

table.insert(keys, {
   "<leader>ss",
   function()
      require("harpoon.ui").toggle_quick_menu()
   end,
   desc = "Harpoon Menu",
})

table.insert(keys, {
   "<leader>sa",
   function()
      require("harpoon.mark").add_file()
   end,
   desc = "Harpoon Add file",
})

table.insert(keys, {
   "<leader>st",
   function()
      vim.api.nvim_command [[split]]
      require("harpoon.term").gotoTerminal(1)
      vim.api.nvim_command [[startinsert]]
   end,
   desc = "Harpoon quick split Terminal",
})

for i = 1, binds do
   table.insert(keys, {
      string.format("<leader>%s", i),
      function()
         require("harpoon.ui").nav_file(i)
      end,
      desc = "Harpoon go to file " .. i,
   })
end

return {
   "ThePrimeagen/harpoon",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
   },
   keys = keys,
   opts = {
      global_settings = {
         enter_on_sendcmd = true,
      },
   },
}
