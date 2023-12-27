return {
   {
      "Exafunction/codeium.vim",
      event = "InsertEnter",
      config = function()
         vim.keymap.set('i', '<A-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
         vim.keymap.set('i', '<A-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            { expr = true, silent = true })
         vim.keymap.set('i', '<A-n>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            { expr = true, silent = true })
         vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      end
   },
   {
      "Exafunction/codeium.nvim",
      enabled = false,
      dependencies = {
         "nvim-lua/plenary.nvim",
         "hrsh7th/nvim-cmp",
      },
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("codeium").setup({})
         -- vim.keymap.set('i', '<C-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true })
         -- vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
         -- vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
         -- vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
         -- vim.keymap.set('i', '<A-c>', function() return vim.fn['codeium#Complete']() end, { expr = true })
      end,
   }
}
