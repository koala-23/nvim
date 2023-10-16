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
                vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { buffer = bufnr, desc ="Prev hunk" })
                vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc ="Preview hunk" })
                vim.keymap.set("n", "<leader>h[", gitsigns.next_hunk, { buffer = bufnr, desc ="Next hunk" })
                vim.keymap.set("n", "<leader>h]", gitsigns.prev_hunk, { buffer = bufnr, desc ="Prev hunk" })
                vim.keymap.set("n", "<leader>hc", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc ="Blame line" })
            end,
            max_file_length = 10000,
        }
    end,
}
