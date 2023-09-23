return {
    "adalessa/laravel.nvim",
    dependencies = {
        "rcarriga/nvim-notify",
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Laravel", "LaravelInfo" },
    keys = {
        { "<leader>ls", ":Artisan serve<cr>",      desc = "Laravel Server",               noremap = true, silent = true },
        { "<leader>la", ":Laravel artisan<cr>",    desc = "Laravel Application Commands", noremap = true, silent = true },
        { "<leader>lr", ":Laravel routes<cr>",     desc = "Laravel Application Routes",   noremap = true, silent = true },
    },
    config = function()
        vim.g.laravel_log_level = "debug"
        require("laravel").setup({
            split = {
                relative = "editor",
                position = "bottom",
                size = "20%",
                enter = true,
            },
            route_info = {
                position = "top",
            },
        })
        require("telescope").load_extension "laravel"
    end,
}
