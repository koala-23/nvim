return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
        -- Change '<C-g>' here to any keycode you like.
        vim.g.codeium_disable_bindings = 1
        vim.keymap.set('i', '<A-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<A-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<A-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        vim.keymap.set('i', '<A-c>', function() return vim.fn['codeium#Complete']() end, { expr = true })
    end,
}
