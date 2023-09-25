return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gg", "<cmd>Git<cr>",  desc = "Git add" },
        { "<leader>ga", "<cmd>Git add .<cr>",  desc = "Git add" },
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
        { "<leader>gl", "<cmd>Git log<cr>",   desc = "Git log" },
    },
    cmd = { "G", "Git" },
}
