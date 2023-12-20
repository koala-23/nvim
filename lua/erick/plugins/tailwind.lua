return {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    ft = {"html", "blade",  "php", "javascript", "typescript", "vue"},
    config = function()
        require("tailwindcss-colorizer-cmp").setup({
            color_square_width = 2,
        })
    end
}
