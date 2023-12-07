return {
   "Exafunction/codeium.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
   },
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      require("codeium").setup({})
      vim.keymap.set('i', '<C-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      vim.keymap.set('i', '<A-c>', function() return vim.fn['codeium#Complete']() end, { expr = true })
   end,
}
