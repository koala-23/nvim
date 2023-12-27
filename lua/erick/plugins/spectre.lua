return {
   "nvim-pack/nvim-spectre",
   build = false,
   cmd = "Spectre",
   opts = { open_cmd = "noswapfile vnew" },
   keys = {
      { "<leader>R",  function() require("spectre").open() end,                             desc = "Search" },
   },
}
