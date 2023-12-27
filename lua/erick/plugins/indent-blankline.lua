return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
        scope = {
            enabled = false
        },
        indent = {
            char = "▏",
            repeat_linebreak = false,
        },
    },
}
