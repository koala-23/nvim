return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>ga", ":Git add .<cr>",  desc = "Git add" },
        { "<leader>gc", ":Git commit<cr>", desc = "Git commit" },
        { "<leader>gl", ":Git log<cr>",   desc = "Git log" },
    },
    cmd = { "G", "Git" },
}
