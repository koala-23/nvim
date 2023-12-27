return {
   "nvim-pack/nvim-spectre",
   build = false,
   cmd = "Spectre",
   opts = { open_cmd = "noswapfile vnew" },
   keys = {
      { "<leader>R",  function() require("spectre").open() end,                             desc = "Search" },
      { '<leader>RR', function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
   },
}
