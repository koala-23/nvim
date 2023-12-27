return {
    'smoka7/hop.nvim',
    version = "*",
    config = true,
    keys = {
        { "ff", "<cmd>HopWord<cr>",    desc = "Hop word" },
        { "fl", "<cmd>HopWordCurrentLine<cr>", desc = "Hop word" },
        { "fw", "<cmd>HopPattern<cr>", desc = "Hop pattern" },
    }
}
