return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require "gitsigns"
        gitsigns.setup {
            signcolumn = false,
            numhl = true,
            trouble = false,
            on_attach = function(bufnr)
                vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc ="Stage hunk" })
                vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc ="Undo stage hunk" })
                vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc ="Reset hunk" })
                vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc ="Preview hunk" })
                vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr, desc ="Next hunk" })
                vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr, desc ="Prev hunk" })
            end,
            max_file_length = 10000,
        }
    end,
}
