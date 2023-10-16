return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
        { "<leader>gl", "<cmd>Git log<cr>",   desc = "Git log" },
    },
    cmd = { "G", "Git" },
}
