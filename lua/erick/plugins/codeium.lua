return {
    {
        "Exafunction/codeium.vim",
        event = "InsertEnter",
        init = function()
            local codeium_filetypes = {
                [".env"] = false
            }
            vim.g.codeium_disable_bindings = 1
            vim.g.codeium_filetypes = codeium_filetypes
        end,
        config = function()
            vim.keymap.set('i', '<A-Enter>', function() return vim.fn['codeium#Accept']() end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<A-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<A-n>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    },
}
